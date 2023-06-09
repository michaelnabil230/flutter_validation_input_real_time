import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsUrl extends Rule {
  IsUrl({
    super.customError,
  });

  @override
  bool isValid(String value) {
    return RegExp(
      r'^((https?):\/\/)((www\.)?([a-zA-Z0-9!_$]+)\.([a-zA-Z]{2,5}))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    ).hasMatch(value);
  }

  @override
  String error() => 'validation.not_valid_url';
}
