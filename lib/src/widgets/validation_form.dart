import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/src/widgets/text_field_custom.dart';

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
  final Set<TextFieldCustomState> _fields = <TextFieldCustomState>{};

  void register(TextFieldCustomState field) => _fields.add(field);

  void unregister(TextFieldCustomState field) => _fields.remove(field);

  void fieldIsChanged() => widget.onChanged.call(isPass);

  bool get isPass =>
      _fields.every((input) => input.controller.inputStream.value.isPass);

  @override
  Widget build(BuildContext context) => widget.child;
}
