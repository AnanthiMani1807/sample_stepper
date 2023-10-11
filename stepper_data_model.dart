
import 'package:flutter/material.dart';
import '../enum/enum.dart';

class StepperData {
  final String userType;
  final String name;
  final DateTime dateTime;
  final StepperEnum status;
  final Color stepperColor;
  final Color stepperLine;

  StepperData({
    required this.userType,
    required this.name,
    required this.dateTime,
    required this.status,
    required this.stepperColor,
    required this.stepperLine,
  });

  StepperData copyWith({
    String? userType,
    String? name,
    DateTime? dateTime,
    StepperEnum? status,
    Color? stepperColor,
    Color? stepperLine,
  }) {
    return StepperData(
      userType: userType ?? this.userType,
      name: name ?? this.name,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
      stepperColor: stepperColor ?? this.stepperColor,
      stepperLine: stepperLine ?? this.stepperLine,
    );
  }

  factory StepperData.fromJson(Map<String, dynamic> jsonData) {
    return StepperData(
      userType: jsonData['userType'] as String,
      name: jsonData['name'] as String,
      dateTime: DateTime.parse(jsonData['dateTime'] as String),
      status: getStatusText(jsonData['status']),
      stepperColor: jsonData['status'] == 'Returned' ? Colors.pinkAccent.shade100 : Colors.green,
      stepperLine: jsonData['status'] == 'Returned' ? Colors.red : Colors.grey,
    );
  }
}
