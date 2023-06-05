import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Sometimes extends Rule {
  @override
  bool isValid(String value) => true;

  @override
  String error() => throw Exception('This rules can not show errors');
}
