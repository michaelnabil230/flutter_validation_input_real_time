import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/src/input.dart';
import 'package:rxdart/rxdart.dart';

class ValidationTextEditingController extends TextEditingController {
  ValidationTextEditingController({super.text});

  late BehaviorSubject<Input> inputStream;

  late List<BehaviorSubject<Input>> _streamInputs;

  List<Input> get _inputs => _streamInputs
      .map((BehaviorSubject<Input> stream) => stream.value)
      .toList();

  void initValidation(List<BehaviorSubject<Input>> streamInputs,
      BehaviorSubject<Input> stream) {
    inputStream = stream;
    _streamInputs = streamInputs;
  }

  void setError(String? errorText) {
    inputStream.add(inputStream.value.setError(errorText));
  }

  void clearError() {
    inputStream.add(inputStream.value.copyWith(value: '', errorMassage: null));
  }

  void _runValidation() {
    Input input = inputStream.value.runValidation(_inputs, text);
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

    _runValidation();
  }

  @override
  void dispose() {
    inputStream.close();
    super.dispose();
  }
}
