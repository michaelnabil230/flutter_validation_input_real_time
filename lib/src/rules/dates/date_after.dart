import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDateAfter extends Rule {
  final DateTime date;

  IsDateAfter(this.date);

  @override
  bool isValid(String value) {
    DateTime? input = DateTime.tryParse(value);

    return input != null && input.isAfter(date);
  }

  @override
  String toString() => 'validation.must_be_after_date';
}
