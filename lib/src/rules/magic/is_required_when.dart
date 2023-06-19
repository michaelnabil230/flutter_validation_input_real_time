import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/text/is_required.dart';

class IsRequiredWhen extends Rule {
  final bool boolean;

  IsRequiredWhen({
    super.customError,
    required this.boolean,
  });

  @override
  bool isValid(String value) {
    if (boolean) {
      return IsRequired().isValid(value);
    }

    return false;
  }

  @override
  String error() => 'validation.required_when';
}
