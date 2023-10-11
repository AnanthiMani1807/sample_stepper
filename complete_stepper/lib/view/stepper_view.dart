import 'package:flutter/material.dart';
import 'package:shipment_calendar/model/sample_model.dart';
import 'package:shipment_calendar/model/stepper_data_model.dart';
import 'package:shipment_calendar/view/stepper_design_sample.dart';
import '../enum/enum.dart';

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

class GenericStepper<T> extends StatelessWidget {
  /// Create empty list to store the list of data
  final List<T> steps;
  final Axis scrollDirection;

  const GenericStepper({
    Key? key,
    required this.steps,
    /// remove the require key word of final field when you initialize
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        itemCount: steps.length,
        itemBuilder: (BuildContext context, int index) {
         // print(steps.runtimeType);
          final step = steps[index];
          //print(T.runtimeType);
          if (T == StepperData) {
            ///stepHolder : assign the List to StepperModel Instance
            return SampleStepperDesign(stepHolder: step as StepperData);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
