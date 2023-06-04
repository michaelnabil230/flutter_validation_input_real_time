import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDateAfter extends Rule {
  final DateTime date;

  IsDateAfter(this.date);

  @override
  bool isValid(String value) => isDateAfter(value, date);

  @override
  String toString() => 'validation.must_be_after_date';
}

bool isDateAfter(Object? value, DateTime date) {
  DateTime? input;
  if (value is String) {
    input = DateTime.tryParse(value);
  } else if (value is DateTime) {
    input = value;
  }
  return input != null && input.isAfter(date);
}
