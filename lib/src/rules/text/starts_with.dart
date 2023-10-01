import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class StartsWith extends Rule {
  final Pattern pattern;

  StartsWith(
    this.pattern, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value.trim().startsWith(pattern);

  @override
  String get name => ValidationNames.startsWith;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [pattern])
        : customValidationMessage!.call(attribute, [pattern]);
  }
}
