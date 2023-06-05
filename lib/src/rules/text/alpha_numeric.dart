import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class AlphaNumeric extends Rule {
  AlphaNumeric({
    super.customError,
  });

  @override
  bool isValid(String value) => RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value);

  @override
  String error() => 'validation.alpha_numeric';
}
