import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haul27/app/modules/login/bindings/login_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: "Haul27",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.from(
              colorScheme: const ColorScheme.highContrastLight(
                  primary: Color(0xFFFF6B00)))
          .copyWith(
              appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
      initialBinding: LoginBinding(),
    ),
  );
}
