import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDateBefore extends Rule {
  final DateTime date;

  IsDateBefore(
    this.date, {
    super.customError,
  });

  @override
  bool isValid(String value) {
    DateTime? input = DateTime.tryParse(value);

    return input != null && input.isBefore(date);
  }

  @override
  String error() => 'validation.must_be_before_date';
}
