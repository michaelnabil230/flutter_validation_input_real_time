import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsBool extends Rule {
  IsBool({
    super.customError,
  });

  @override
  bool isValid(String value) {
    return ['true', 'false', '0', '1']
        .any((e) => e.compareTo(value.trim().toLowerCase()) == 0);
  }

  @override
  String error() => 'validation.is_not_bool';
}
