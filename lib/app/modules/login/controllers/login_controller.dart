import 'package:get/get.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';
import 'package:haul27/app/services/remote/strava/strava_service.dart';

class LoginController extends GetxController {
  //find strava servicce
  final StravaService _stravaService =
      Get.find(tag: (StravaService).toString());
  Rx<StravaAthleteModel> athlete = StravaAthleteModel().obs;
  void authorize() async {
    final response = await _stravaService.authorize();
    response.fold((l) => null, (r) {
      getAthlete(r);
    });
  }

  void getAthlete(String code) async {
    final response = await _stravaService.getAthlete(code);
    response.fold((l) => null, (r) => athlete(r));
  }
}
