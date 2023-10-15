import 'package:flutter/material.dart';
import 'package:shipment_calendar/model/stepper_data_model.dart';
import 'package:shipment_calendar/view/stepper_design_sample.dart';
import '../date_format/date_format.dart';


class HorizontalStepper<T extends StepperData> extends StatelessWidget {
  final List<T> steps;

  const HorizontalStepper({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: steps.length,
      itemBuilder: (BuildContext context, int index) {
        // print(steps.runtimeType);
        final step = steps[index];
        //print(T.runtimeType);
        // if (T == StepperData) {
        //final aInstance = reflect(T);
        return HorizontalStepperGeneric(
          isLastIndex: index == steps.length - 1,
          stepperStatus: step.status.isNegative,
          topWidget:  Column(
            children: [
              Text(DateTimeFormatter.customDateFormatter(step.dateTime),),
              Text(DateTimeFormatter.customTimeFormatter(step.dateTime),),
            ],
          ),
          bottomWidget: Column(
            children: [
              SizedBox(width: 150,
                  child: Text(step.status.displayName)),
              Text(step.userType),
            ],
          ),

        );
        //  }return const SizedBox.shrink();
      },
    );
  }
}


