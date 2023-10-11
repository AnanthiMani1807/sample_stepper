import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String customDateFormatter(DateTime dateTime) {
    final date = DateFormat('MM/dd/yyyy').format(dateTime);
    return date;
  }

  static String customTimeFormatter(DateTime dateTime) {
    final time = DateFormat('hh:mm').format(dateTime);
    return time;
  }
}
