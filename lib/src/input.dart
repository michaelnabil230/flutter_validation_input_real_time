import 'package:flutter_validation_input_real_time/src/rules/lists/not_repeat_value.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Input {
  final String name;

  final List<Rule> rules;

  final List<String> oldValues;

  late String? errorMassage;

  Input({
    required this.name,
    required this.rules,
    this.oldValues = const [],
    this.errorMassage,
  });

  Input runValidation(String value) {
    for (final rule in rules) {
      if (rule is NotRepeat) {
        rule.setList(oldValues);
      }

      errorMassage = rule.isValid(value) ? null : rule.toString();
      if (errorMassage != null) {
        break;
      }
    }

    return setError(errorMassage);
  }

  bool get isPass => errorMassage == null;

  bool get isNotPass => !isPass;

  @override
  String toString() => 'Input(name: $name)';

  Input setOldValues(List<String>? oldValues) {
    return Input(
      name: name,
      oldValues: oldValues ?? this.oldValues,
      errorMassage: errorMassage,
      rules: rules,
    );
  }

  Input setError(String? errorMassage) {
    return Input(
      name: name,
      oldValues: oldValues,
      errorMassage: errorMassage ?? this.errorMassage,
      rules: rules,
    );
  }
}
