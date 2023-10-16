import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipment_calendar/model/stepper_data_model.dart';
import 'package:shipment_calendar/view/stepper_generic.dart';
import '../common_widget/widget_value_loader.dart';
import '../provider/provider.dart';



class GenericStepper extends StatelessWidget {
  /// Create empty list to store the list of data
  const GenericStepper({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final asyncValueProvider = Provider<AsyncValue<List<StepperData>>>(
          (ref) => ref.watch(stepDataProvider),
    );

    return WidgetValueLoader(
      value: asyncValueProvider,
      data: (step) {
        return  HorizontalStepper<StepperData>(
          data: step,
          dateTimeExtractor: (item) => item.dateTime,
          nameExtractor: (item) => item.name,
          userTypeExtractor: (item) => item.userType,
          statusExtractor: (item) => item.status,
        );
      },
      loadingBuilder: () => const CircularProgressIndicator(),
      errorBuilder: (error, stackTrace) => Text('Error: $error'),

    );
  }
}

