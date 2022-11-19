import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haul27/app/common/api/haul_error.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';

abstract class AnonymousLoginService {
  Future<Either<HaulException, User>> loginAnonymousFirebase(
      StravaAthleteModel athlete);
}
