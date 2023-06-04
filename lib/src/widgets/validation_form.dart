import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/src/input.dart';
import 'package:flutter_validation_input_real_time/src/widgets/wrap_text_field.dart';
import 'package:rxdart/subjects.dart';

class ValidationForm extends StatefulWidget {
  final Widget child;

  final Function(bool value) onChanged;

  const ValidationForm({
    super.key,
    required this.child,
    required this.onChanged,
  });

  static ValidationFormState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<ValidationFormState>();

  @override
  ValidationFormState createState() => ValidationFormState();
}

class ValidationFormState extends State<ValidationForm> {
  final Set<WrapTextFieldState> _fields = <WrapTextFieldState>{};

  void register(WrapTextFieldState field) => _fields.add(field);

  void unregister(WrapTextFieldState field) => _fields.remove(field);

  void fieldIsChanged() => widget.onChanged.call(isPass);

  bool get isPass =>
      _fields.every((input) => input.controller.inputStream.value.passes);

  List<BehaviorSubject<Input>> get streamInputs =>
      _fields.map((input) => input.controller.inputStream).toList();

  @override
  Widget build(BuildContext context) => widget.child;
}
