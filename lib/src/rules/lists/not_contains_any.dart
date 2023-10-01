import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/contains_any.dart';

class NotContainsAny extends Rule {
  final List<String> list;

  NotContainsAny(
    this.list, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => !containsAny(value, list);

  @override
  String get name => ValidationNames.mustNotContainsAny;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [list])
        : customValidationMessage!.call(attribute, [list]);
  }
}
