import 'package:intl/intl.dart';

String formatDateTime(String date) {
  DateTime dateTime = DateTime.parse(date);

// Date Formatter
  DateFormat dateFormatter = DateFormat("dd MMM yyyy");

//   Format the date
  String formattedDate = dateFormatter.format(dateTime);

  return formattedDate;
}
