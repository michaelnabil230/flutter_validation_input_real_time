import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

class InputProvider extends ChangeNotifier {
  Input addError(
    Input input,
    String error, {
    List<String> ignore = const [],
  }) {
    Input newInput = input.addError(error).addIgnoreValues(ignore);

    notifyListeners();

    return newInput;
  }

  Input runValidation(Input input, String text) {
    Input newInput = input.runValidation(text);

    notifyListeners();

    return newInput;
  }

  Input enable(Input input) {
    Input newInput = input.copyWith(enabled: true);

    notifyListeners();

    return newInput;
  }

  Input disable(Input input) {
    Input newInput = input.copyWith(enabled: false);

    notifyListeners();

    return newInput;
  }

  // TODO: I don't understand how works but I want to remove this fun
  Input getInput(Input input) => input;
}
