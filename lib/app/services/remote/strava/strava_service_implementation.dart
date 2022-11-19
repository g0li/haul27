import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:haul27/app/common/api/endpoints.dart';
import 'package:haul27/app/common/api/haul_error.dart';
import 'package:haul27/app/models/strava/strava_user_model.dart';
import 'package:haul27/app/routes/app_pages.dart';
import 'package:haul27/app/services/remote/strava/strava_service.dart';

import '../../../common/api/interceptors/network_manager.dart';

class StravaServiceImplementation extends BaseRemoteSource
    implements StravaService {
  @override
  Future<Either<HaulException, String>> authorize() async {
    Map<String, String> params = {
      'client_id': kStravaClientID,
      'redirect_uri': kStravaRedirectURI,
      'response_type': kStravaResponseType,
      'approval_prompt': kStravaApprovalType,
      'scope': kStravaScope
    };

    try {
      final code = await Get.toNamed(Routes.WEBVIEW,
          arguments: Uri.https(kBaseUrl.split('://')[1], kAuthorize, params));
      return right(code);
    } on HaulException catch (gE) {
      return left(gE);
    }
  }

  @override
  Future<Either<HaulException, StravaAthleteModel>> getAthlete(
      String code) async {
    try {
      Map<String, String> params = {
        'client_id': kStravaClientID,
        'client_secret': kStravaClientSecret,
        'code': code,
        'grant_type': kStravaGrantType,
      };
      final dioCall = dio.post(kToken, data: params);
      final response = await callApiWithErrorParser(dioCall);

      return right(StravaAthleteModel.fromMap(response.data));
    } on HaulException catch (gE) {
      return left(gE);
    }
  }
}
