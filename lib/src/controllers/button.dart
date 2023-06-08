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
    _setButtonData(ButtonFromData(passes: passes, isLoading: isLoading));
  }

  ButtonFromData get({bool listen = false}) {
    return Provider.of<ButtonProvider>(context, listen: listen).buttonFromData;
  }

  void isLoading(bool isLoading) {
    context.read<ButtonProvider>().isLoading(isLoading);
  }

  void _setButtonData(ButtonFromData buttonFromData) {
    context.read<ButtonProvider>().setButtonData(buttonFromData);
  }
}
