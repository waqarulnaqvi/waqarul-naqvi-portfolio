import 'package:flutter/material.dart';
import 'package:portfolio/constants/skill_items.dart';

import '../constants/colors.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  // List to manage the hover state for each item
  final List<Color> _textColors = List.filled(platformItems.length, CustomColor.whiteSecondary);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 60.0,
      runSpacing: 40.0,
      children: [
        for (int i = 0; i < platformItems.length; i++)
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _textColors[i] = CustomColor.yellowSecondary; // Change color on hover
              });
            },
            onExit: (_) {
              setState(() {
                _textColors[i] = CustomColor.whiteSecondary; // Reset color when not hovering
              });
            },
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: _textColors[i], width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        platformItems[i]['img'],
                        width: 26.0,
                        height: 26.0,
                        color: _textColors[i],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        platformItems[i]['title'],
                        style: TextStyle(
                          color: _textColors[i],
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
