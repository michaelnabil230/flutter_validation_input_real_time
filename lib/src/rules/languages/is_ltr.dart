import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:intl/intl.dart';

class IsLtr extends Rule {
  @override
  bool isValid(String value) => !Bidi.detectRtlDirectionality(value);

  @override
  String toString() => 'validation.must_be_english';
}
