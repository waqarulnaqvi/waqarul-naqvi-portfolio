import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SiteLogo extends StatefulWidget {
  const SiteLogo({Key? key}) : super(key: key);

  @override
  _SiteLogoState createState() => _SiteLogoState();
}

class _SiteLogoState extends State<SiteLogo> {
  // Variable to track hover state
  Color _textColor = CustomColor.whiteSecondary;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/images/waqarulicon.jpeg"),
        ),
        const SizedBox(width: 10),
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _textColor = CustomColor.yellowSecondary; // Change color on hover
            });
          },
          onExit: (_) {
            setState(() {
              _textColor = CustomColor.whiteSecondary; // Reset color when not hovering
            });
          },
          child: Text(
            "Waqarul Naqvi",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: _textColor,
            ),
          ),
        ),
      ],
    );
  }
}
