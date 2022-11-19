import 'package:dartz/dartz.dart';
import 'package:haul27/app/common/api/haul_error.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';

abstract class StravaService {
  Future<Either<HaulException, String>> authorize();
  Future<Either<HaulException, StravaAthleteModel>> getAthlete(String code);
}
