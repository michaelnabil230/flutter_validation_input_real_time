import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsIn extends Rule {
  final List<String> list;

  IsIn(
    this.list, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => isIn(value, list);

  @override
  String get name => ValidationNames.mustBeInList;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [list])
        : customValidationMessage!.call(attribute, [list]);
  }
}

bool isIn(String v, List<String> list) => list.any((e) => e.compareTo(v) == 0);
