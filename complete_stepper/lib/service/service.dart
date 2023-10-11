import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';

class StepDataService {
  Future<String> loadStepDataJson() async {
    final jsonString = await rootBundle.loadString('assets/sample.json');
    return jsonString;
  }
}

final stepDataServiceProvider = StateProvider<StepDataService>((ref) {
  return StepDataService();
});