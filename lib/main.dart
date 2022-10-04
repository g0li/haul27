import 'package:flutter/material.dart';
import 'package:haul27/constants/app_colors.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haul27',
      theme: ThemeData(
        primaryColor: kAscentLightPrimary,
      ),
      home: const LoginPage(),
    );
  }
}
