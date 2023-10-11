import 'package:flutter/material.dart';
import '../date_format/date_format.dart';
import '../enum/enum.dart';
import '../model/stepper_data_model.dart';

class SampleStepperDesign extends StatelessWidget {
  ///Creating the instance of the model that is passed as T
  final StepperData stepHolder;

  const SampleStepperDesign({
    Key? key,
    required this.stepHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          DateTimeFormatter.customDateFormatter(stepHolder.dateTime),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Text(
          DateTimeFormatter.customTimeFormatter(stepHolder.dateTime),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: stepHolder.status.stepperColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                stepHolder.status.icon,
               // color: Colors.white,
                size: 30,
              ),
            ),
            stepHolder.status == StepperEnum.returned
                ? CustomPaint(
                    size: const Size(150, 2), // Adjust the size as needed
                    painter: StepperLinesPainter(stepCount: 15),
                  )
                : Container(
                    height: 2,
                    width: 150,
                    color: stepHolder.status.stepperLine,
                  ),
            const SizedBox(height: 8.0),
          ],
        ),
        SizedBox(
          width: 150,
          child: Text(
            stepHolder.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          '(${stepHolder.userType})',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          stepHolder.status.displayName,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
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
