import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsUserName extends Rule {
  IsUserName({
    super.customError,
  });

  @override
  bool isValid(String value) => RegExp(r'^[a-zA-Z0-9_]{3,16}$').hasMatch(value);

  @override
  String error() => 'validation.username';
}
