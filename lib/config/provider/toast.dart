import 'dart:async';
import 'package:flutter/material.dart';

void showToast(
  BuildContext context,
  String message, {
  Color backgroundColor = Colors.white,
  Color textColor = Colors.black,
  double borderRadius = 8.0,
  Duration duration = const Duration(seconds: 2),
}) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).size.height * 0.8,
      left: (MediaQuery.of(context).size.width -
              _calculateWidth(message, context)) /
          2,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Text(
            message,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);

  Timer(duration, () {
    overlayEntry.remove();
  });
}

double _calculateWidth(String message, BuildContext context) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(
      text: message,
      style: const TextStyle(color: Colors.white),
    ),
    textDirection: TextDirection.ltr,
  )..layout(maxWidth: MediaQuery.of(context).size.width);

  return textPainter.size.width + 48.0;
}
