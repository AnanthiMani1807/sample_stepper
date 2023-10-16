import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipment_calendar/common_widget/widget_value_loader.dart';
import 'package:shipment_calendar/model/stepper_data_model.dart';
import 'package:shipment_calendar/view/stepper_items.dart';
import 'package:shipment_calendar/view/stepper_view.dart';
import '../date_format/date_format.dart';
import '../provider/provider.dart';

class StepperDialog extends StatelessWidget {
  const StepperDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncValueProvider = Provider<AsyncValue<List<StepperData>>>(
      (ref) => ref.watch(stepDataProvider),
    );
    return WidgetValueLoader(
      value: asyncValueProvider,
      data: (List<StepperData> stepperDataList) {
        return CustomStepper<StepperData>(
          stepLength: stepperDataList.length,
          items: stepperDataList.asMap().entries.map((entry) {
            final index = entry.key;
            final StepperData e = entry.value;
            return StepperItems<StepperData>(
              index: index,
              stepLength: stepperDataList.length,
              stepperStatus: e.status.isNegative,
              stepperColor: e.status.stepperColor,
              lineColor: e.status.stepperLine,
              icon: e.status.icon,
              value: e,
              crownWidget: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    DateTimeFormatter.customDateFormatter(e.dateTime),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    DateTimeFormatter.customTimeFormatter(e.dateTime),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              bottomWidget: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '(${e.userType})',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    e.status.displayName,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (StepperData val) {},
        );
      },
      loadingBuilder: () => const CircularProgressIndicator(),
      errorBuilder: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
