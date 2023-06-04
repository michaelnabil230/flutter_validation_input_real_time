import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:rxdart/subjects.dart';

class WrapButtonSubmit extends StatefulWidget {
  final Widget Function(ButtonFromData buttonFromData) child;

  final List<ValidationTextEditingController> inputs;

  const WrapButtonSubmit({
    super.key,
    required this.child,
    required this.inputs,
  });

  @override
  State<WrapButtonSubmit> createState() => WrapButtonSubmitState();
}

class WrapButtonSubmitState extends State<WrapButtonSubmit> {
  final ButtonFromData _initialData = ButtonFromData.empty();

  late BehaviorSubject<ButtonFromData> _stream;

  @override
  void initState() {
    _stream = BehaviorSubject.seeded(_initialData);

    super.initState();
  }

  @override
  void dispose() {
    _stream.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ButtonFromData>(
      stream: _stream,
      initialData: _initialData,
      builder: (context, snapshot) => widget.child.call(snapshot.requireData),
    );
  }
}
