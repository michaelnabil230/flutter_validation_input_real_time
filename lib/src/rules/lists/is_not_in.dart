import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/is_in.dart';

class IsNotIn extends Rule {
  final List<String> list;

  IsNotIn(
    this.list, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => !isIn(value, list);

  @override
  String get name => ValidationNames.mustNotBeInList;
}
