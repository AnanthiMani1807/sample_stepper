import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipment_calendar/common_widget/widget_value_loader.dart';
import 'package:shipment_calendar/provider/provider.dart';
import 'package:shipment_calendar/view/stepper_view.dart';
import 'model/stepper_data_model.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {

    final asyncValueProvider = Provider<AsyncValue<List<StepperData>>>(
      (ref) => ref.watch(stepDataProvider),
    );

    return ProviderScope(
      child: WidgetValueLoader(
        value: asyncValueProvider,
        data: (List<StepperData> data) {  // always pass data with type
          return GenericStepper<StepperData>(
            scrollDirection: Axis.horizontal,
            steps: data,
          );
        },
        loadingBuilder: () => const CircularProgressIndicator(),
        errorBuilder: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Sample(),
      ),
    ),
  ));
}
