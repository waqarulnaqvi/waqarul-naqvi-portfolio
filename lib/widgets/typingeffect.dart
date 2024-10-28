import 'dart:async';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TypingEffect extends StatefulWidget {
  final String text;  // The text to display
  final Duration speed;
  final double fontSize;// Speed of typing

  const TypingEffect({required this.text, this.speed = const Duration(milliseconds: 150), this.fontSize=30.0});

  @override
  _TypingEffectState createState() => _TypingEffectState();
}

class _TypingEffectState extends State<TypingEffect> {
  String _displayedText = "";  // Current text being displayed
  int _currentIndex = 0;  // Current character index
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();  // Cancel the timer when widget is disposed
    super.dispose();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.speed, (timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_currentIndex];
          _currentIndex++;
        });
      } else {
        // Reset the text and restart typing
        setState(() {
          _displayedText = "";
          _currentIndex = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style:TextStyle(
        fontSize: widget.fontSize,
        height: 1.5,
        fontWeight: FontWeight.bold,
        color: CustomColor.whitePrimary,
      ),  // Customize text style
    );
  }
}
