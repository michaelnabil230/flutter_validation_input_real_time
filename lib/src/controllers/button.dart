import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_form_data.dart';
import 'package:provider/provider.dart';

class ButtonController {
  final BuildContext _context;

  ButtonController({
    required BuildContext context,
    required List<ValidationTextEditingController> inputs,
    bool passes = false,
    bool isLoading = false,
  }) : _context = context {
    provider()
      ..setInputs(inputs)
      ..setButtonData(ButtonFormData(passes: passes, isLoading: isLoading));
  }

  ButtonProvider provider({bool listen = false}) {
    return Provider.of<ButtonProvider>(_context, listen: listen);
  }

  ButtonFormData get({bool listen = false}) {
    return provider(listen: listen).buttonFormData;
  }

  void isLoading(bool isLoading) => provider().isLoading(isLoading);
}
