import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDateBefore extends Rule {
  final DateTime date;

  IsDateBefore(
    this.date, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) {
    DateTime? input = DateTime.tryParse(value);

    return input != null && input.isBefore(date);
  }

  @override
  String get name => ValidationNames.mustBeBeforeDate;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [date])
        : customValidationMessage!.call(attribute, [date]);
  }
}
