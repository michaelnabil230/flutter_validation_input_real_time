import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/is_in.dart';

class IsNotIn extends Rule {
  final List<Object> list;

  IsNotIn(this.list);

  @override
  bool isValid(String value) => isNotIn(value, list);

  @override
  String toString() => 'validation.must_not_be_in_list';
}

bool isNotIn(Object v, List<Object> list) => !isIn(v, list);
