import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsArabicNum extends Rule {
  @override
  bool isValid(String value) => isArabicNum(value);

  @override
  String toString() => 'validation.must_be_num';
}

bool isArabicNum(String input) {
  //ToDo if it's starts with 0 , i.e 032158 it's not a valid number
  return RegExp('^[1-9][0-9]*\$').hasMatch(input);
}
