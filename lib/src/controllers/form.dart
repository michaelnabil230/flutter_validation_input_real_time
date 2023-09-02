import 'package:flutter/cupertino.dart' hide FormState;
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/form_group.dart';
import 'package:provider/provider.dart';

class FormController {
  final BuildContext _context;

  final List<ValidationTextEditingController> _inputs;

  List<ValidationTextEditingController> get inputs => _inputs;

  FormController({
    required BuildContext context,
    required List<ValidationTextEditingController> inputs,
    FormState state = FormState.disable,
    bool isEdit = false,
  })  : _inputs = inputs,
        _context = context {
    provider()
      ..setInputs(_inputs)
      ..setFormGroup(FormGroup(state: state, isEdit: isEdit));
  }

  FormProvider provider({bool listen = false}) {
    return Provider.of<FormProvider>(_context, listen: listen);
  }

  FormGroup get({bool listen = false}) => provider(listen: listen).formGroup;

  void changeState(FormState state) => provider().changeState(state);
}
