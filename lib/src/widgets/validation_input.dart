import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:provider/provider.dart';

class ValidationInput extends StatelessWidget {
  final Widget child;

  final Map<String, ValidationMessage> validationMessages;

  const ValidationInput({
    super.key,
    required this.child,
    this.validationMessages = const {},
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InputProvider(validationMessages),
      child: child,
    );
  }
}
