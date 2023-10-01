import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsNumbersOnly extends Rule {
  IsNumbersOnly({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => int.tryParse(value) != null;

  @override
  String get name => ValidationNames.isNumbersOnly;
}
