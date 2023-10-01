import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsYoutubeUrl extends Rule {
  IsYoutubeUrl({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) {
    return RegExp(
            r"(?:https?:\/\/)?(?:www\.)?(?:youtube\.com|youtu\.be)\/(?:watch\?v=|embed\/|v\/)?([\w-]{11})")
        .hasMatch(value);
  }

  @override
  String get name => ValidationNames.notValidYoutubeUrl;
}
