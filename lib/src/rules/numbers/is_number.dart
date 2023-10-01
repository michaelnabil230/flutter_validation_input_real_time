import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsNumber extends Rule {
  IsNumber({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => num.tryParse(value) != null;

  @override
  String get name => ValidationNames.mustBeInt;
}
