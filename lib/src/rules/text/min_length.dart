import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MinLength extends Rule {
  final int min;

  MinLength(
    this.min, {
    super.customError,
  });

  @override
  bool isValid(String value) => value.trim().length >= min;

  @override
  String error() => 'validation.min';
}
