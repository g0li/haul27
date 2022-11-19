import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haul27/app/modules/login/bindings/login_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Haul27",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: LoginBinding(),
    ),
  );
}
