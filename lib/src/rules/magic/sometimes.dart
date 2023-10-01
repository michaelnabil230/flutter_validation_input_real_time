import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Sometimes extends Rule {
  @override
  bool isValid(String value) => true;

  @override
  String get name => throw Exception('This rules can not show errors');

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
