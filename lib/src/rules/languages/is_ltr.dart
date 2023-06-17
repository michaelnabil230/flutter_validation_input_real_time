import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsLtr extends Rule {
  IsLtr({
    super.customError,
  });

  @override
  bool isValid(String value) => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value);

  @override
  String error() => 'validation.must_be_english';
}
