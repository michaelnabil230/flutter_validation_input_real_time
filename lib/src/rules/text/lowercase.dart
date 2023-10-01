import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Lowercase extends Rule {
  Lowercase({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => RegExp(r'[a-z]').hasMatch(value);

  @override
  String get name => ValidationNames.lowercase;
}
