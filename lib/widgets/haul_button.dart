import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_textstyles.dart';

class HaulButton extends StatelessWidget {
  const HaulButton({super.key, required this.child, required this.onPressed});
  final Widget child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      elevation: 0,
      textStyle: kButtonLargeTextStyle.copyWith(color: kGreyscaleLightWhite),
      fillColor: kAscentLightPrimary,
      child: child,
    );
  }
}
