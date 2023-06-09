import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class NotContains extends Rule {
  final String other;

  NotContains(
    this.other, {
    super.customError,
  });

  @override
  bool isValid(String value) => !value.trim().contains(other);

  @override
  String error() => 'validation.not_contains';
}
