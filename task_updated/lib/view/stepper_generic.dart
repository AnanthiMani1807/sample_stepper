import 'package:flutter/material.dart';
import 'package:shipment_calendar/view/stepper_design_sample.dart';
import '../date_format/date_format.dart';
import '../enum/enum.dart';

class StepperDataHolder {
  final DateTime dateTime;
  final String? name;
  final String? userType;
  final StepperEnum status;

  StepperDataHolder({
    required this.dateTime,
    this.name,
    this.userType,
    required this.status,
  });
}

class HorizontalStepper<T> extends StatelessWidget {
  final List<T> data;
  final DateTime Function(T) dateTimeExtractor;
  final String Function(T) nameExtractor;
  final String Function(T) userTypeExtractor;
  final StepperEnum Function(T) statusExtractor;

  const HorizontalStepper({
    Key? key,
    required this.data,
    required this.dateTimeExtractor,
    required this.nameExtractor,
    required this.userTypeExtractor,
    required this.statusExtractor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        print(data.length);
        final item = data[index];
        final dateTime = dateTimeExtractor(item);
        final name = nameExtractor(item);
        final userType = userTypeExtractor(item);
        final status = statusExtractor(item);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateTimeFormatter.customDateFormatter(dateTime),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              DateTimeFormatter.customTimeFormatter(dateTime),
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
                    color: status.stepperColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    status.icon,
                    size: 30,
                  ),
                ),
                status == StepperEnum.returned
                    ? CustomPaint(
                  size: const Size(150, 2),
                  painter: StepperLinesPainter(stepCount: 15),
                )
                    : Container(
                  height: 2,
                  width: 150,
                  color: status.stepperLine,
                ),
                const SizedBox(height: 8.0),
              ],
            ),
            SizedBox(
              width: 150,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '($userType)',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              status.displayName,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        );
      },
    );
  }
}

