import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class AlphaNumeric extends Rule {
  AlphaNumeric({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value);

  @override
  String get name => ValidationNames.alphaNumeric;
}
