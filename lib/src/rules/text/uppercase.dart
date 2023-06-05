import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Uppercase extends Rule {
  Uppercase({
    super.customError,
  });

  @override
  bool isValid(String value) => RegExp(r'[A-Z]').hasMatch(value);

  @override
  String error() => 'validation.uppercase';
}
