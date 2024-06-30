import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

String countDown() {
  LocalDateTime a = LocalDateTime.now();
  LocalDateTime b = LocalDateTime.dateTime(DateTime.parse('2024-11-27'));
  Period diff = b.periodSince(a);
  return '${diff.months} bulan ${diff.days} hari lagi';
}

int countAge(date) {
  LocalDateTime a = LocalDateTime.now();
  LocalDateTime b = LocalDateTime.dateTime(DateTime.parse(date));
  Period diff = a.periodSince(b);
  return diff.years;
}

String dateIndo(date) {
  return DateFormat("d MMMM yyyy", "id_ID").format(DateTime.parse(date));
}
