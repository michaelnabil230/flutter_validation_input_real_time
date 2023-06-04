import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class RegExpRule extends Rule {
  final RegExp regX;

  const RegExpRule(this.regX);

  @override
  bool isValid(String value) => regX.hasMatch(value);

  @override
  String toString() => 'validation.is_not_valid';
}
