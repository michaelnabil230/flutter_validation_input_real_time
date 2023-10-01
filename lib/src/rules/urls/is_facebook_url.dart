import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsFacebookUrl extends Rule {
  IsFacebookUrl({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) {
    return RegExp(
      r'^((https?):\/\/)((www\.)?(facebook|fb)\.(com))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    ).hasMatch(value);
  }

  @override
  String get name => ValidationNames.notValidFacebookUrl;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
