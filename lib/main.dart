import 'package:flutter/material.dart';
import 'package:haul27/constants/app_colors.dart';
import 'package:haul27/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kAscentLightPrimary,
      ),
      home: const LoginPage(),
    );
  }
}
