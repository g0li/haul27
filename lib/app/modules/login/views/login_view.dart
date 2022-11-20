import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.checkIfAuthentic();
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Hero(
          tag: 'orange',
          child: ElevatedButton(
            child: const Text('Connect with Strava'),
            onPressed: () {
              controller.authorize();
            },
          ),
        ),
      ).marginAll(30),
    );
  }
}
