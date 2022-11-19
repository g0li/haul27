import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haul27/app/common/api/haul_error.dart';
import 'package:haul27/app/common/api/interceptors/network_manager.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';

import 'anonymous_login_service.dart';

class AnonymousLoginServiceImpl extends BaseRemoteSource
    implements AnonymousLoginService {
  @override
  Future<Either<HaulException, User>> loginAnonymousFirebase(
      StravaAthleteModel athlete) async {
    try {
      final signInWithCTokenResponse = await auth.signInAnonymously();
      signInWithCTokenResponse.user!.updateDisplayName(
          '${athlete.athlete!.firstname!} ${athlete.athlete!.lastname!}');
      signInWithCTokenResponse.user!.updatePhotoURL(athlete.athlete!.profile);
      return right(auth.currentUser!);
    } on HaulException catch (gE) {
      return left(gE);
    }
  }
}
