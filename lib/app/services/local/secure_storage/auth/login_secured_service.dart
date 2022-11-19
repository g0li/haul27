import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haul27/app/common/api/haul_error.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';

abstract class LoginSecuredService {
  Future<Either<HaulException, bool>> saveStravaAthlete(
      StravaAthleteModel athlete);
  Future<Either<HaulException, bool>> saveFirebaseUser(
      Map<String, dynamic> firebaseUser);
  Future<Either<HaulException, Map<String, dynamic>>> findFirebaseUser();
  Future<Either<HaulException, StravaAthleteModel>> findStravaAthlete();
}
