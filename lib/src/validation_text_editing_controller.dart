import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/src/classes/input.dart';
import 'package:rxdart/rxdart.dart';

class ValidationTextEditingController extends TextEditingController {
  ValidationTextEditingController({super.text});

  late BehaviorSubject<Input> inputStream;

  void initValidation(BehaviorSubject<Input> stream) => inputStream = stream;

  void setError(String error) {
    inputStream.add(inputStream.value.addError(error));
  }

  void clearError() {
    inputStream.add(inputStream.value.copyWith(value: '', errors: []));
  }

  @override
  void clear() {
    super.clear();
    clearError();
  }
}
