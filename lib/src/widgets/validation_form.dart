import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/src/classes/input.dart';
import 'package:flutter_validation_input_real_time/src/widgets/wrap_text_field.dart';
import 'package:rxdart/subjects.dart';

class ValidationForm extends StatefulWidget {
  final Widget child;

  final Function(bool value) onChanged;

  final bool isEditForm;

  const ValidationForm({
    super.key,
    required this.child,
    required this.onChanged,
    this.isEditForm = false,
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

  void fieldIsChanged() => widget.onChanged.call(passes);

  bool get passes {
    if (widget.isEditForm) {
      return _fields.any(_inputPasses);
    }

    return _fields.every(_inputPasses);
  }

  bool _inputPasses(WrapTextFieldState state) =>
      state.controller.inputStream.value.isValid;

  bool get fails => !passes;

  List<BehaviorSubject<Input>> get streamInputs =>
      _fields.map((input) => input.controller.inputStream).toList();

  @override
  Widget build(BuildContext context) => widget.child;
}
