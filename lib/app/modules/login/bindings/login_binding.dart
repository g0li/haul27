import 'package:get/get.dart';
import 'package:haul27/app/services/local/secure_storage/auth/login_secured_service.dart';
import 'package:haul27/app/services/local/secure_storage/auth/login_secured_service_impl.dart';
import 'package:haul27/app/services/remote/firebase_auth/anonymous_login_service_impl.dart';
import 'package:haul27/app/services/remote/strava/strava_service.dart';
import 'package:haul27/app/services/remote/strava/strava_service_implementation.dart';

import '../../../services/remote/firebase_auth/anonymous_login_service.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

    Get.lazyPut<StravaService>(
      () => StravaServiceImplementation(),
      tag: (StravaService).toString(),
    );
    Get.lazyPut<AnonymousLoginService>(
      () => AnonymousLoginServiceImpl(),
      tag: (AnonymousLoginService).toString(),
    );
    Get.lazyPut<LoginSecuredService>(
      () => LoginSecuredServiceImplementation(),
      tag: (LoginSecuredService).toString(),
    );
  }
}
