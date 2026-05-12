import 'package:chat_app/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  const HighlightedText({
    super.key,
    required this.text
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Color(0xFF63C6B2)],
          stops: [0.7, 0.7], // Hard line at 60% height
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        text,
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}
