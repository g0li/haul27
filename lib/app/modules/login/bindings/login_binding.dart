import 'package:get/get.dart';
import 'package:haul27/app/services/remote/strava/strava_service.dart';
import 'package:haul27/app/services/remote/strava/strava_service_implementation.dart';

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
  }
}
