import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/sample_model.dart';
import '../model/stepper_data_model.dart';
import '../service/service.dart';

final stepDataProvider = FutureProvider<List<StepperData>>((ref) async {
  final stepDataService =
      ref.read(stepDataServiceProvider); // Get the StepDataService instance
  final jsonString = await stepDataService
      .loadStepDataJson(); // Call the method on the instance

  // Convert the JSON string to a List<dynamic>
  final List<dynamic> jsonData = json.decode(jsonString) as List<dynamic>;

  // Convert the List<dynamic> to a List<StepperData>
  List<StepperData> stepDataList;
  stepDataList = jsonData.map((jsonMap) {
    return StepperData.fromJson(jsonMap as Map<String, dynamic>);
  }).toList();

  return stepDataList;
});

final asyncValueProvider = Provider<AsyncValue<List<StepperData>>>(
  (ref) => ref.watch(stepDataProvider),
);
