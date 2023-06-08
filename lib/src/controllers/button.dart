import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_form_data.dart';
import 'package:flutter_validation_input_real_time/src/providers/button.dart';
import 'package:provider/provider.dart';

class ButtonController {
  final BuildContext context;

  ButtonController({
    required this.context,
    bool passes = false,
    bool isLoading = false,
  }) {
    _setButtonData(ButtonFormData(passes: passes, isLoading: isLoading));
  }

  ButtonFormData get({bool listen = false}) {
    return Provider.of<ButtonProvider>(context, listen: listen).buttonFormData;
  }

  void isLoading(bool isLoading) {
    context.read<ButtonProvider>().isLoading(isLoading);
  }

  void _setButtonData(ButtonFormData buttonFormData) {
    context.read<ButtonProvider>().setButtonData(buttonFormData);
  }
}
