import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/src/input.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/validation_text_editing_controller.dart';
import 'package:flutter_validation_input_real_time/src/widgets/validation_form.dart';
import 'package:rxdart/subjects.dart';

class TextFieldCustom extends StatefulWidget {
  final String name;

  final List<Rule> rules;

  final String hintText;

  final ValidationTextEditingController controller;

  final TextInputType keyboardType;

  const TextFieldCustom({
    super.key,
    required this.name,
    required this.keyboardType,
    required this.rules,
    required this.hintText,
    required this.controller,
  });

  @override
  State<TextFieldCustom> createState() => TextFieldCustomState();
}

class TextFieldCustomState extends State<TextFieldCustom> {
  ValidationTextEditingController get controller => widget.controller;

  Input get initialData => Input(name: widget.name, rules: widget.rules);

  late final BehaviorSubject<Input> _inputStream =
      BehaviorSubject.seeded(initialData);

  @override
  void initState() {
    controller.setInputStream(_inputStream);

    ValidationForm.maybeOf(context)?.register(this);

    _inputStream.listen((_) {
      ValidationForm.maybeOf(context)?.fieldIsChanged();
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
      initialData: initialData,
      builder: (context, snapshot) {
        Input input = snapshot.requireData;

        return AnimatedSize(
          duration: const Duration(milliseconds: 400),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              keyboardType: widget.keyboardType,
              style: TextStyle(
                color: input.isNotPass ? Colors.red : Colors.green,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: input.isNotPass ? Colors.red : Colors.green,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: _getColor(input.isPass)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: _getColor(input.isPass)),
                ),
                errorText: input.errorMassage,
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.0,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getColor(bool isPass) {
    if (!isPass) {
      return Colors.red;
    }

    return Colors.green;
  }
}
