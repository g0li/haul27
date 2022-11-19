import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haul27/app/common/api/haul_error.dart';
import 'package:haul27/app/common/api/interceptors/local_storage_manager.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';

import 'login_secured_service.dart';

class LoginSecuredServiceImplementation extends BaseLocalSource
    implements LoginSecuredService {
  @override
  Future<Either<HaulException, bool>> saveFirebaseUser(
      Map<String, dynamic> firebaseUser) async {
    try {
      storage.write(
          key: 'firebaseUser.uid', value: firebaseUser['firebaseUser.uid']);
      storage.write(
          key: 'firebaseUser.displayName',
          value: firebaseUser['firebaseUser.displayName']);

      return right(true);
    } on HaulException catch (gE) {
      return left(gE);
    }
  }

  @override
  Future<Either<HaulException, Map<String, dynamic>>> findFirebaseUser() async {
    try {
      String? uid = await storage.read(key: 'firebaseUser.uid');
      String? displayName = await storage.read(key: 'firebaseUser.displayName');

      if (uid != null && displayName != null) {
        return right({
          'uid': await storage.read(key: 'firebaseUser.uid'),
          'displayName': await storage.read(key: 'firebaseUser.displayName'),
        });
      } else {
        return left(HaulException(message: 'FirebaseUser does not exist'));
      }
    } on HaulException catch (gE) {
      return left(gE);
    }
  }

  @override
  Future<Either<HaulException, bool>> saveStravaAthlete(
      StravaAthleteModel athlete) async {
    try {
      storage.write(key: 'strava.athlete', value: athlete.toJson());
      return right(true);
    } on HaulException catch (gE) {
      return left(gE);
    }
  }

  @override
  Future<Either<HaulException, StravaAthleteModel>> findStravaAthlete() async {
    try {
      final athlete = await storage.read(key: 'strava.athlete');
      if (athlete != null) {
        return right(StravaAthleteModel.fromJson(athlete));
      } else {
        return left(HaulException(message: 'Strava Athlete does not exist'));
      }
    } on HaulException catch (gE) {
      return left(gE);
    }
  }
}
