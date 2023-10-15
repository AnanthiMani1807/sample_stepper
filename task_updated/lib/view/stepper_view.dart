import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipment_calendar/common_widget/widget_value_loader.dart';
import 'package:shipment_calendar/model/stepper_data_model.dart';
import 'package:shipment_calendar/view/stepper_generic.dart';
import '../enum/enum.dart';
import '../provider/provider.dart';

abstract class StepperDataHolder {
  final DateTime dateFormat;
  final DateTime timeFormat;
  final Axis scrollDirection;
  final String? name;
  final String? userType;
  final StepperEnum status;

  StepperDataHolder({
    required this.dateFormat,
    required this.timeFormat,
    this.scrollDirection = Axis.vertical,
    this.name,
    this.userType,
    required this.status,
  });
}

class StepperDialog extends StatelessWidget {
  /// Create empty list to store the list of data

  const StepperDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final asyncValueProvider = Provider<AsyncValue<List<StepperData>>>(
      (ref) => ref.watch(stepDataProvider),
    );
    return SizedBox(
      height: 250,
      child: WidgetValueLoader(
        value: asyncValueProvider,
        data: (List<StepperData> steps) {
          // always pass data with type
          return HorizontalStepper<StepperData>(steps: steps);
        },
        loadingBuilder: () => const CircularProgressIndicator(),
        errorBuilder: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}

