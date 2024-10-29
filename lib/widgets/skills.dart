import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../constants/skill_items.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  final List<Color> _frameworkColors = List.filled(frameworkItems.length, CustomColor.whiteSecondary);
  final List<Color> _languageColors = List.filled(skillItems.length, CustomColor.whiteSecondary);
  final List<EdgeInsets> _frameworkPaddings = List.filled(frameworkItems.length, const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0));
  final List<EdgeInsets> _languagePaddings = List.filled(skillItems.length, const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0));
  final Duration tapEffectDuration = const Duration(seconds: 1);

  void _handleTap(List<Color> colorList, List<EdgeInsets> paddingList, int index) {
    HapticFeedback.vibrate(); // Vibration feedback
    setState(() {
      colorList[index] = CustomColor.yellowSecondary;
      paddingList[index] = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0); // Increase vertical and horizontal padding
    });

    // Timer to reset color and padding
    Timer(tapEffectDuration, () {
      setState(() {
        colorList[index] = CustomColor.whiteSecondary;
        paddingList[index] = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0); // Reset padding
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Frameworks:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20.0),

          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: frameworkItems.asMap().entries.map((entry) {
              int index = entry.key;
              var framework = entry.value;
              return MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _frameworkColors[index] = CustomColor.yellowSecondary;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _frameworkColors[index] = CustomColor.whiteSecondary;
                  });
                },
                child: GestureDetector(
                  onTap: () => _handleTap(_frameworkColors, _frameworkPaddings, index),
                  child: Chip(
                    padding: _frameworkPaddings[index],
                    label: Text(
                      framework["title"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _frameworkColors[index],
                      ),
                    ),
                    avatar: Image.asset(framework["img"]),
                    backgroundColor: Colors.black,
                    shape: StadiumBorder(
                      side: BorderSide(color: _frameworkColors[index]),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 40.0),

          const Text(
            "Languages:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20.0),

          Wrap(
            spacing: 10.0,
            runSpacing: 15.0,
            children: skillItems.asMap().entries.map((entry) {
              int index = entry.key;
              var skill = entry.value;
              return MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _languageColors[index] = CustomColor.yellowSecondary;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _languageColors[index] = CustomColor.whiteSecondary;
                  });
                },
                child: GestureDetector(
                  onTap: () => _handleTap(_languageColors, _languagePaddings, index),
                  child: Chip(
                    padding: _languagePaddings[index],
                    label: Text(
                      skill["title"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _languageColors[index],
                      ),
                    ),
                    avatar: Image.asset(skill["img"]),
                    backgroundColor: Colors.black,
                    shape: StadiumBorder(
                      side: BorderSide(color: _languageColors[index]),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
