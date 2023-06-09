import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class RegExpRule extends Rule {
  final RegExp regX;

  RegExpRule(
    this.regX, {
    super.customError,
  });

  @override
  bool isValid(String value) => regX.hasMatch(value);

  @override
  String error() => 'validation.is_not_valid';
}
