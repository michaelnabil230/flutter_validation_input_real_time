import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/src/providers/input.dart';
import 'package:flutter_validation_input_real_time/src/providers/form.dart';
import 'package:provider/provider.dart';

class ValidationInput extends StatelessWidget {
  final Widget child;

  final Map<String, String> validationMessages;

  const ValidationInput({
    super.key,
    required this.child,
    this.validationMessages = const {},
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => InputProvider(validationMessages)),
        ChangeNotifierProvider(create: (_) => FormProvider()),
      ],
      child: child,
    );
  }
}
