import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class EndsWith extends Rule {
  final String end;

  EndsWith(
    this.end, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value.trim().endsWith(end);

  @override
  String get name => ValidationNames.mustEndWith;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [end])
        : customValidationMessage!.call(attribute, [end]);
  }
}
