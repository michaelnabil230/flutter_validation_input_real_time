import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/text/required.dart';

class RequiredWhen extends Rule {
  final bool boolean;

  final String conditionName;

  RequiredWhen({
    super.customValidationMessage,
    required this.boolean,
    required this.conditionName,
  });

  @override
  bool isValid(String value) {
    if (boolean) {
      return Required().isValid(value);
    }

    return true;
  }

  @override
  String get name => ValidationNames.requiredWhen;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [conditionName])
        : customValidationMessage!.call(attribute, [conditionName]);
  }
}
