import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/src/input.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/validation_text_editing_controller.dart';
import 'package:flutter_validation_input_real_time/src/widgets/validation_form.dart';
import 'package:rxdart/subjects.dart';

class WrapTextField extends StatefulWidget {
  final String name;

  final List<Rule> rules;

  final Widget Function(Input input) textField;

  final ValidationTextEditingController controller;

  const WrapTextField({
    super.key,
    required this.name,
    required this.rules,
    required this.textField,
    required this.controller,
  });

  @override
  State<WrapTextField> createState() => WrapTextFieldState();
}

class WrapTextFieldState extends State<WrapTextField> {
  ValidationTextEditingController get controller => widget.controller;

  Input get _initialData => Input(name: widget.name, rules: widget.rules);

  late final BehaviorSubject<Input> _inputStream =
      BehaviorSubject.seeded(_initialData);

  @override
  void initState() {
    controller.setInputStream(_inputStream);

    ValidationFormState? form = ValidationForm.maybeOf(context);

    form?.register(this);

    _inputStream.listen((_) {
      form?.fieldIsChanged();
    });

    super.initState();
  }

  @override
  void dispose() {
    _inputStream.close();

    ValidationForm.maybeOf(context)?.unregister(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Input>(
      stream: controller.inputStream,
      initialData: _initialData,
      builder: (context, snapshot) =>
          widget.textField.call(snapshot.requireData),
    );
  }
}
