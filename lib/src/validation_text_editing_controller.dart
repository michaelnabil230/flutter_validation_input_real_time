import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/src/input.dart';
import 'package:rxdart/rxdart.dart';

class ValidationTextEditingController extends TextEditingController {
  ValidationTextEditingController({super.text});

  late BehaviorSubject<Input> inputStream;

  void setInputStream(BehaviorSubject<Input> stream) => inputStream = stream;

  void setError(String? errorText) {
    inputStream.add(inputStream.value.setError(errorText));
  }

  void clearError() => setError(null);

  void runValidation() {
    Input input = inputStream.value.runValidation(text);
    inputStream.add(input);
  }

  @override
  void clear() {
    super.clear();
    clearError();
  }

  @override
  set value(TextEditingValue newValue) {
    super.value = newValue;

    runValidation();
  }

  @override
  void dispose() {
    inputStream.close();
    super.dispose();
  }
}
