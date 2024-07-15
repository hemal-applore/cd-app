import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String toDDMMYYYY() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toDDMMMYYYY() {
    return DateFormat('dd MMM yyyy').format(this);
  }
}
