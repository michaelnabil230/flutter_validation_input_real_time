import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:intl/intl.dart';

class IsRtl extends Rule {
  @override
  bool isValid(String value) => Bidi.detectRtlDirectionality(value);

  @override
  String toString() => 'validation.must_be_arabic';
}
