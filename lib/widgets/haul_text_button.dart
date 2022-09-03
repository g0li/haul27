import 'package:flutter/material.dart';

import '../constants/app_textstyles.dart';

class HaultTextButton extends StatelessWidget {
  const HaultTextButton(
      {super.key, required this.child, required this.onPressed});
  final Widget child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      elevation: 0,
      textStyle: kButtonLargeTextStyle,
      child: child,
    );
  }
}
