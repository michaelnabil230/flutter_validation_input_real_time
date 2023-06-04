import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/not_repeat_value.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Input {
  final String name;

  final String value;

  final List<Rule> rules;

  final List<String> oldValues;

  late String? errorMassage;

  Input({
    required this.name,
    this.value = '',
    required this.rules,
    this.oldValues = const [],
    this.errorMassage,
  });

  Input runValidation(List<Input> inputs, String value) {
    for (final rule in rules) {
      rule.setInputs(inputs);

      if (rule is NotRepeat) {
        rule.setList(oldValues);
      }

      errorMassage = rule.isValid(value) ? null : rule.toString();
      if (errorMassage != null) {
        break;
      }
    }

    return copyWith(value: value, errorMassage: errorMassage);
  }

  bool get passes => errorMassage == null;

  bool get fails => !passes;

  @override
  String toString() =>
      'Input(name: $name, value: $value, errorMassage: $errorMassage)';

  Input setOldValues(List<String>? oldValues) => copyWith(oldValues: oldValues);

  Input setError(String? errorMassage) => copyWith(errorMassage: errorMassage);

  Input copyWith({
    String? name,
    String? value,
    List<Rule>? rules,
    List<String>? oldValues,
    String? errorMassage,
  }) {
    return Input(
      name: name ?? this.name,
      value: value ?? this.value,
      rules: rules ?? this.rules,
      oldValues: oldValues ?? this.oldValues,
      errorMassage: errorMassage,
    );
  }
}
