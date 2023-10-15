import 'package:flutter/material.dart';

enum StepperEnum {
  initiated(
    displayName: 'Initiated',
    stepperColor: Colors.green,
    stepperLine: Colors.grey,
    key: 'initiated',
    icon: Icons.check,
    iconColor: Colors.white,
    //svgIcon: 'assets/icons/check.svg',
  ),
  authorized(
    displayName: 'Authorized',
    stepperColor: Colors.green,
    stepperLine: Colors.grey,
    key: 'authorized',
    icon: Icons.check,
    iconColor: Colors.white,
    //svgIcon: 'assets/icons/check.svg',
  ),
  released(
    displayName: 'Released',
    stepperColor: Colors.green,
    stepperLine: Colors.grey,
    key: 'released',
    icon: Icons.check,
    iconColor: Colors.white,
    // svgIcon: 'assets/icons/check.svg',
  ),
  returned(
    displayName: 'Returned',
    stepperColor: Colors.redAccent,
    stepperLine: Colors.red,
    key: 'returned',
    isNegative : true,
    icon: Icons.close,
    iconColor: Colors.red,
    //svgIcon: 'assets/icons/close.svg',
  );

  final String displayName;
  final Color stepperColor;
  final Color stepperLine;
  final String key;
  final IconData icon;
  final Color iconColor;
  final bool isNegative;

  //final String svgIcon;

  const StepperEnum({
    required this.displayName,
    required this.stepperColor,
    required this.stepperLine,
    required this.key,
    required this.icon,
    required this.iconColor,
     this.isNegative = false,

    // required this.svgIcon,
  });
}

class EnumUtils {
  static String getStatusText(StepperEnum status) {
    switch (status) {
      case StepperEnum.initiated:
        return 'initiated';
      case StepperEnum.authorized:
        return 'authorized';
      case StepperEnum.released:
        return 'released';
      case StepperEnum.returned:
        return 'returned';
      default:
        return 'unknown'; // Handle the case for unknown status
    }
  }
}

StepperEnum getStatusText(String status) {
  switch (status) {
    case 'initiated':
      return StepperEnum.initiated;
    case 'authorized':
      return StepperEnum.authorized;
    case 'released':
      return StepperEnum.released;
    case 'returned':
      return StepperEnum.returned;
    default:
      return StepperEnum.initiated; // Handle the case for unknown status
  }
}
