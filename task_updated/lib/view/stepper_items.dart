import 'package:flutter/material.dart';
import 'package:shipment_calendar/common_widget/stepper_line_painter.dart';

class StepperItems<T> extends StatelessWidget {
  final Widget? crownWidget;
  final Widget? bottomWidget;
  final T? value;
  final IconData icon;
  final Color stepperColor;
  final Color lineColor;
  final bool stepperStatus;
  final int index;
  final int stepLength;

  const StepperItems({
    Key? key,
    this.crownWidget,
    this.bottomWidget,
    this.value,
    required this.icon,
    required this.stepperColor,
    required this.lineColor,
    required this.stepperStatus,
    required this.index,
    required this.stepLength,
  }) : super(key: key);

  StepperItems<T> copyWithIndex(int? newIndex, int newStepLength) {
    return StepperItems(
      key: key,
      crownWidget: crownWidget,
      bottomWidget: bottomWidget,
      value: value,
      icon: icon,
      stepperColor: stepperColor,
      lineColor: lineColor,
      stepperStatus: stepperStatus,
      index: newIndex ?? 0,
      stepLength: newStepLength,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        crownWidget ?? const SizedBox.shrink(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: stepperColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            if (index != stepLength - 1)
              stepperStatus
                  ? CustomPaint(
                      size: const Size(150, 2),
                      painter: StepperLinesPainter(stepCount: 15),
                    )
                  : Container(
                      height: 2,
                      width: 150,
                      color: lineColor,
                    ),
            const SizedBox(height: 8.0),
          ],
        ),
        SizedBox(
          width: 150,
          child: bottomWidget ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
