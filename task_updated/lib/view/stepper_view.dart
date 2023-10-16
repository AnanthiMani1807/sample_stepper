import 'package:flutter/material.dart';
import 'package:shipment_calendar/view/stepper_items.dart';
import '../enum/enum.dart';

class StepperDataHolder {
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

class CustomStepper<T> extends StatelessWidget {
  final Axis scrollDirection;
  final Function(T) onChanged;
  final T? value;
  final List<StepperItems<T>> items;

  CustomStepper({
    super.key,
    this.scrollDirection = Axis.horizontal,
    required this.onChanged,
    required this.items,
    this.value,
  }) : assert(
          items.isEmpty ||
              value == null ||
              items.where((StepperItems<T> item) {
                    return item.value == value;
                  }).length ==
                  1,
          "There should be exactly one item with [MyStatus]'s value"
          '$value. \n'
          'Either zero or 2 or more [MyStatus]s were detected '
          'with the same value',
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (_, int index) => items[index],
      ),
    );
  }
}
