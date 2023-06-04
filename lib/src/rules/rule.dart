import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

abstract class Rule {
  Rule();

  late List<Input> inputs;

  bool isValid(String value);

  void setInputs(List<Input> inputs) => this.inputs = inputs;
}
