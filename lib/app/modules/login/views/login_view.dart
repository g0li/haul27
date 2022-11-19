import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          child: const Text('Connect with Strava'),
          onPressed: () {
            controller.authorize();
          },
        ),
      ).marginAll(30),
    );
  }
}
