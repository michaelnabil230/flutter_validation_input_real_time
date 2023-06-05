import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Same extends Rule {
  final String same;

  Same(
    this.same, {
    super.customError,
  });

  @override
  bool isValid(String value) => value == same;

  @override
  String error() => 'validation.same';
}
