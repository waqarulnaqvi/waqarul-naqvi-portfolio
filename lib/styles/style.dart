import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

var kHeaderDecoration = BoxDecoration(
  gradient: const LinearGradient(colors: [
    Colors.transparent,
    CustomColor.bgLight1,
  ]),
  borderRadius: BorderRadius.circular(100),
);

var kButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(
    CustomColor.yellowPrimary.withOpacity(0.8),
  ),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  padding: WidgetStateProperty.all(const EdgeInsets.all(7.0)),
);


var kButtonStyleDisabled = ButtonStyle(
  backgroundColor: WidgetStateProperty.all(
    CustomColor.yellowPrimary.withOpacity(0.3),
  ),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  padding: WidgetStateProperty.all(const EdgeInsets.all(7.0)),
);
