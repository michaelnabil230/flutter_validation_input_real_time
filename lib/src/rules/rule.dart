import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

abstract class Rule {
  final String? customError;

  Rule({
    this.customError,
  });

  late List<Input> inputs;

  late String attribute;

  void initialization(List<Input> inputs, String attribute) {
    this.inputs = inputs;
    this.attribute = attribute;
  }

  bool isValid(String value);

  String error();

  @override
  String toString() => customError ?? error();
}
