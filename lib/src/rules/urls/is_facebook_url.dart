import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsFacebookUrl extends Rule {
  IsFacebookUrl({
    super.customError,
  });

  @override
  bool isValid(String value) {
    return RegExp(
      r'^((https?):\/\/)((www\.)?(facebook|fb)\.(com))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    ).hasMatch(value);
  }

  @override
  String error() => 'validation.not_valid_facebook_url';
}
