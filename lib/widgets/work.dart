import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/skill_items.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  // List to manage the hover state for each item
  final List<Color> _textColors = List.filled(platformItems.length, CustomColor.whiteSecondary);
  final List<bool> _isTapped = List.filled(platformItems.length, false);

  // Duration for which the tap effect will last
  final Duration tapEffectDuration = const Duration(seconds: 1);

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
                _textColors[i] = _isTapped[i] ? CustomColor.yellowSecondary : CustomColor.whiteSecondary;
              });
            },
            child: GestureDetector(
              onTap: () {
                HapticFeedback.vibrate(); // Vibration feedback
                setState(() {
                  _isTapped[i] = true;
                  _textColors[i] = CustomColor.yellowSecondary;
                });

                // Set a timer to reset the tap effect after the specified duration
                Timer(tapEffectDuration, () {
                  setState(() {
                    _isTapped[i] = false;
                    _textColors[i] = CustomColor.whiteSecondary;
                  });
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                width: _isTapped[i] ? 165 : 160, // Slightly increase width on tap
                height: _isTapped[i] ? 55 : 50,   // Slightly increase height on tap
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
          ),
      ],
    );
  }
}
