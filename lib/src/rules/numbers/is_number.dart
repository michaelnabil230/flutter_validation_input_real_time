import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsNumber extends Rule {
  @override
  bool isValid(String value) => num.tryParse(value) != null;

  @override
  String toString() => 'validation.must_be_int';
}
