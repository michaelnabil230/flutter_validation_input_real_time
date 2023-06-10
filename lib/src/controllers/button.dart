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
    provider()
        .setButtonData(ButtonFormData(passes: passes, isLoading: isLoading));
  }

  ButtonProvider provider({bool listen = false}) {
    return Provider.of<ButtonProvider>(context, listen: listen);
  }

  ButtonFormData get({bool listen = false}) {
    return provider(listen: listen).buttonFormData;
  }

  void isLoading(bool isLoading) => provider().isLoading(isLoading);
}
