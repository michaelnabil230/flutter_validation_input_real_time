import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:provider/provider.dart';

class ValidationForm extends StatelessWidget {
  final Widget child;

  const ValidationForm({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormProvider(),
      child: child,
    );
  }
}
