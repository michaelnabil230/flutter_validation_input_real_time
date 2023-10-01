import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/text/required.dart';

class RequiredWhen extends Rule {
  final bool boolean;

  RequiredWhen({
    super.customValidationMessage,
    required this.boolean,
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
}
