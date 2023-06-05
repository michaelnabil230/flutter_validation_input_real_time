import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/contains_any.dart';

class NotRepeat extends Rule {
  late List<String> list;

  final bool caseSensitive;

  NotRepeat({
    this.caseSensitive = false,
    super.customError,
  });

  void setList(List<String> list) => this.list = list;

  @override
  bool isValid(String value) =>
      containsAny(value, list, caseSensitive: caseSensitive);

  @override
  String error() => 'validation.not_repeat';
}
