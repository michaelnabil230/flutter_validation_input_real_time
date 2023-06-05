import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsIn extends Rule {
  final List<String> list;

  IsIn(
    this.list, {
    super.customError,
  });

  @override
  bool isValid(String value) => isIn(value, list);

  @override
  String error() => 'validation.must_be_in_list';
}

bool isIn(String v, List<String> list) => list.any((e) => e.compareTo(v) == 0);
