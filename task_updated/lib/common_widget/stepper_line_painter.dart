import 'package:flutter/material.dart';

class StepperLinesPainter extends CustomPainter {
  final int stepCount;

  StepperLinesPainter({required this.stepCount});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;

    final spaceBetweenCircles = size.width / (stepCount - 1);
    final circleRadius = size.height / 2;

    for (var i = 0; i < stepCount - 1; i++) {
      final x1 = (i + 0.5) * spaceBetweenCircles;
      final y1 = circleRadius;
      final x2 = (i + 1) * spaceBetweenCircles;
      final y2 = circleRadius;

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}