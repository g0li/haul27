import 'package:get/get.dart';
import 'package:haul27/app/common/api/endpoints.dart';

class WebviewController extends GetxController {
  Rx<Uri> url = (Get.arguments as Uri).obs;

  void handleHaul27(String url) {
    if (url.contains(kStravaRedirectURI)) {
      String code = url.split('code=')[1].split('&')[0];
      Get.back(result: code);
    }
  }
}
