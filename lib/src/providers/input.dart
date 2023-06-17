import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

// TODO: I don't understand how works but I want to remove this class
class InputProvider extends ChangeNotifier {
  Input runValidation(Input input, String text) {
    Input newInput = input.runValidation(text);

    notifyListeners();

    return newInput;
  }

  Input getInput(Input input) => input;
}
