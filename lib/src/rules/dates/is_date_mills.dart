import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDateMillis extends Rule {
  final bool isUtc;

  IsDateMillis({this.isUtc = false});

  @override
  bool isValid(String value) => isDateMills(value, isUtc: isUtc);

  @override
  String toString() => 'validation.not_valid_date_millis';
}

bool isDateMills(String v, {bool isUtc = false}) {
  try {
    if (!(int.tryParse(v) != null)) return false;
    DateTime.fromMillisecondsSinceEpoch(
      int.tryParse(v) ?? -1,
      isUtc: isUtc,
    );
    return true;
  } catch (e) {
    return false;
  }
}
