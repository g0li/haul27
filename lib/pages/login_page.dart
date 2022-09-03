import 'package:flutter/material.dart';
import 'package:haul27/constants/app_textstyles.dart';
import 'package:rive/rive.dart';

import '../widgets/haul_button.dart';
import '../widgets/haul_text_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    'haul27',
                    style: kHaul27,
                  ),
                ),
                HaultTextButton(
                  child: const Text('Sign up'),
                  onPressed: () {},
                ),
              ],
            ),
            const AspectRatio(
              aspectRatio: 1,
              child: RiveAnimation.asset(
                'assets/cycle.riv',
              ),
            ),
            Text(
              'New way of touring with friends',
              style: kTextLargeTextStyle,
            )
          ]),
          SizedBox(
            width: double.maxFinite,
            child: HaulButton(
              child: const Text('Sign in with Email'),
              onPressed: () {},
            ),
          ),
        ],
      )),
    );
  }
}
