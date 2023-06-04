import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsIn extends Rule {
  final List<String> list;

  IsIn(this.list);

  @override
  bool isValid(String value) => isIn(value, list);

  @override
  String toString() => 'validation.must_be_in_list';
}

bool isIn(
  Object v,
  List<Object> list,
) {
  if (v is String && list is List<String>) {
    return list.any((e) => e.compareTo(v) == 0);
  } else {
    return list.any((e) => e == v);
  }
}
