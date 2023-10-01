import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/contains_any.dart';

class NotContainsAny extends Rule {
  final List<String> list;

  NotContainsAny(
    this.list, {
    super.customValidationMessage,
  });

  @override
  String get name => ValidationNames.mustNotContainsAny;

  @override
  bool isValid(String value) => !containsAny(value, list);
}
