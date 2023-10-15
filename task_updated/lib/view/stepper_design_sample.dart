import 'package:flutter/material.dart';

class HorizontalStepperGeneric extends StatelessWidget {
  ///Creating the instance of the model that is passed as T
  final bool isLastIndex;
  final Widget? topWidget;
  final Widget? bottomWidget;
  final bool stepperStatus;

  const HorizontalStepperGeneric({
    Key? key,
    this.isLastIndex = false,
    required this.stepperStatus,
    this.topWidget,
    this.bottomWidget,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       topWidget ?? const SizedBox.shrink(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: stepperStatus ? Colors.red : Colors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(
                stepperStatus ? Icons.close : Icons.check,
                // color: Colors.white,
                size: 30,
              ),
            ),
            if (!isLastIndex)
              stepperStatus
                  ? CustomPaint(
                size: const Size(170, 2), // Adjust the size as needed
                painter: StepperLinesPainter(stepCount: 15),
              )
                  : Container(
                height: 2,
                width: 170,
                color: Colors.green,
              ),
          ],
        ),
       bottomWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}

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
