import 'package:intl/intl.dart';

String formatDateFromString(String date) {
  var now = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
  var formatter = new DateFormat('MMM dd, yy');
  String formatted = formatter.format(now);
  return formatted;
}