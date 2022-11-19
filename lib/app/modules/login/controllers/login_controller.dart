import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';
import 'package:haul27/app/services/local/secure_storage/auth/login_secured_service.dart';
import 'package:haul27/app/services/remote/firebase_auth/anonymous_login_service.dart';
import 'package:haul27/app/services/remote/strava/strava_service.dart';

class LoginController extends GetxController {
  //find strava service
  final StravaService _stravaService =
      Get.find(tag: (StravaService).toString());

  //Strava User
  Rx<StravaAthleteModel> stravaAthlete = StravaAthleteModel().obs;

  //find anonymous login firebase service
  final AnonymousLoginService _firebaseService =
      Get.find(tag: (AnonymousLoginService).toString());

  //Firebase User
  RxMap<String, dynamic> firebaseUser = <String, dynamic>{}.obs;

  //find LoginSecuredService
  final LoginSecuredService _securedService =
      Get.find(tag: (LoginSecuredService).toString());

// Authenticated if both athlete and firebase user data exists in SS
  RxBool isAuthenticated = false.obs;
  void authorize() async {
    final response = await _stravaService.authorize();
    response.fold((l) => null, (r) {
      getAthlete(r);
    });
  }

  //Fetch Athlete from Strava Token API
  void getAthlete(String code) async {
    final response = await _stravaService.getAthlete(code);
    response.fold((l) => null, (r) async {
      stravaAthlete(r);
      final securedAthlete =
          await _securedService.saveStravaAthlete(stravaAthlete.value);
      securedAthlete.fold((l) => null, (r) {
        if (r) {
          loginWithFirebase(stravaAthlete.value);
        } else {
          // handle false statement

          log('l.message!');
        }
      });
    });
  }

//Login anonymously with Firebase
  void loginWithFirebase(StravaAthleteModel athlete) async {
    final response = await _firebaseService.loginAnonymousFirebase(athlete);
    response.fold((l) {
      log(l.message!);
    }, (r) async {
      firebaseUser.value = {
        'firebaseUser.uid': r.uid,
        'firebaseUser.displayName': r.displayName,
      };
      final userSecured = await _securedService.saveFirebaseUser(firebaseUser);
      userSecured.fold((l) {
        log('l.message!');
      }, (r) => isAuthenticated(r));
    });
    checkIfAuthentic();
  }

//check secured storage for athlete and firebase info
  void checkIfAuthentic() async {
    final firebaseUserMap = await _securedService.findFirebaseUser();
    final athlete = await _securedService.findStravaAthlete();
    bool fbUserExists = false;
    bool athleteExists = false;

    firebaseUserMap.fold(
        (l) => fbUserExists = false, (r) => fbUserExists = true);
    athlete.fold((l) => athleteExists = false, (r) {
      athleteExists = true;
      stravaAthlete(r);
    });
    if (fbUserExists == true && athleteExists == true) {
      isAuthenticated(true);
    } else {
      isAuthenticated(false);
    }
    log('fbUserExists ${fbUserExists.toString()}');
    log('athleteExists ${athleteExists.toString()}');
  }

  @override
  void onInit() {
    super.onInit();
    checkIfAuthentic();
  }
}
