import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/src/classes/input.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/validation_text_editing_controller.dart';
import 'package:flutter_validation_input_real_time/src/widgets/validation_form.dart';
import 'package:rxdart/subjects.dart';

class WrapTextField extends StatefulWidget {
  final String attribute;

  final List<Rule> rules;

  final Widget Function(Input input) child;

  final ValidationTextEditingController controller;

  const WrapTextField({
    super.key,
    required this.attribute,
    required this.rules,
    required this.child,
    required this.controller,
  });

  @override
  State<WrapTextField> createState() => WrapTextFieldState();
}

class WrapTextFieldState extends State<WrapTextField> {
  ValidationTextEditingController get controller => widget.controller;

  late Input _initialData;

  late BehaviorSubject<Input> _inputStream;

  @override
  void initState() {
    _initialData = Input(
      attribute: widget.attribute,
      value: controller.text,
      rules: widget.rules,
    );

    _inputStream = BehaviorSubject.seeded(_initialData);

    ValidationFormState? form = ValidationForm.maybeOf(context);

    controller.initValidation(_inputStream);

    form?.register(this);

    controller.addListener(() => _runValidation(form));

    super.initState();
  }

  @override
  void dispose() {
    _inputStream.close();

    ValidationForm.maybeOf(context)?.unregister(this);

    super.dispose();
  }

  void _runValidation(ValidationFormState? form) {
    List<Input> inputs = form!.streamInputs
        .map((BehaviorSubject<Input> stream) => stream.value)
        .toList();

    Input input = _inputStream.value.runValidation(inputs, controller.text);
    _inputStream.add(input);

    form.fieldIsChanged();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Input>(
      stream: _inputStream,
      initialData: _initialData,
      builder: (context, snapshot) => widget.child.call(snapshot.requireData),
    );
  }
}
