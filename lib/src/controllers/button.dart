import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_data.dart';
import 'package:provider/provider.dart';

class ButtonController {
  final BuildContext _context;

  final List<ValidationTextEditingController> _inputs;

  List<ValidationTextEditingController> get inputs => _inputs;

  ButtonController({
    required BuildContext context,
    required List<ValidationTextEditingController> inputs,
    ButtonState state = ButtonState.disable,
    bool isEditForm = false,
  })  : _inputs = inputs,
        _context = context {
    provider()
      ..setInputs(_inputs)
      ..setButtonData(ButtonData(state: state, isEditForm: isEditForm));
  }

  ButtonProvider provider({bool listen = false}) {
    return Provider.of<ButtonProvider>(_context, listen: listen);
  }

  ButtonData get({bool listen = false}) {
    return provider(listen: listen).buttonData;
  }

  void changeState(ButtonState state) => provider().changeState(state);
}
