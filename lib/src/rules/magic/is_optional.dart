import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsOptional extends Rule {
  @override
  bool isValid(String value) => true;

  @override
  String toString() => throw Exception('this rules can not show errors');
}
