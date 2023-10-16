
import 'package:flutter/material.dart';
import '../enum/enum.dart';

class StepperData {
  final String userType;
  final String name;
  final DateTime dateTime;
  final StepperEnum status;

  StepperData({
    required this.userType,
    required this.name,
    required this.dateTime,
    required this.status,
  });

  StepperData copyWith({
    String? userType,
    String? name,
    DateTime? dateTime,
    StepperEnum? status,
  }) {
    return StepperData(
      userType: userType ?? this.userType,
      name: name ?? this.name,
      status: status ?? this.status,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  factory StepperData.fromJson(Map<String, dynamic> jsonData) {
    return StepperData(
      userType: jsonData['userType'] as String,
      name: jsonData['name'] as String,
      dateTime: DateTime.parse(jsonData['dateTime'] as String),
      status: getStatusText(jsonData['status'].toString().toLowerCase()),
     );
  }
}
