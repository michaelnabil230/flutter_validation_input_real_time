import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Same extends Rule {
  final String same;

  Same(
    this.same, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value == same;

  @override
  String get name => ValidationNames.same;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [same])
        : customValidationMessage!.call(attribute, [same]);
  }
}
