import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

void main() => runApp(const MaterialApp(home: ValidationInput(child: MyApp())));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValidationTextEditingController _emailController;
  late ValidationTextEditingController _passwordController;
  late ValidationTextEditingController _passwordConfirmationController;
  late ButtonController _buttonController;

  @override
  void initState() {
    _initTextController();

    _buttonController = ButtonController(context: context);

    super.initState();
  }

  void _initTextController() {
    _emailController = ValidationTextEditingController(
      context: context,
      attribute: 'email',
      rules: () {
        return [
          IsRequired(),
          NotRepeat(),
          IsEmail(),
        ];
      },
    );

    _passwordController = ValidationTextEditingController(
      context: context,
      attribute: 'password',
      rules: () {
        return [
          IsRequired(),
          Password(min: 3),
          Same(_passwordConfirmationController.text),
        ];
      },
    );

    _passwordConfirmationController = ValidationTextEditingController(
      context: context,
      attribute: 'password_confirmation',
      rules: () {
        return [
          IsRequired(),
          Password(min: 3),
          Same(_passwordController.text),
        ];
      },
    );
  }

  void _login() {
    if (!_buttonController.get().passes) {
      log('Please fill the inputs first');
      return;
    }

    log('The request has ben sended in back-end');
    _buttonController.isLoading(true);

    Future.delayed(const Duration(seconds: 5), () {
      _emailController.addError(
        'The email is exits in database',
        withIgnoreValue: true,
      );

      _buttonController.isLoading(false);
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the real-time validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              controller: _emailController,
              hintText: 'Email',
              input: _emailController.get(),
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Password',
              input: _passwordController.get(),
              keyboardType: TextInputType.visiblePassword,
            ),
            CustomTextField(
              controller: _passwordConfirmationController,
              hintText: 'Password confirmation',
              input: _passwordConfirmationController.get(),
              keyboardType: TextInputType.visiblePassword,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: _login,
                child: Container(
                  height: 58,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: _buttonController.get().passes
                        ? Colors.blue
                        : Colors.red,
                  ),
                  alignment: Alignment.center,
                  child: _buttonController.get().isLoading
                      ? const Text('Login is loading')
                      : const Text('Login'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Input input;

  final String hintText;

  final ValidationTextEditingController controller;

  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.input,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 400),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(color: color),
          enabled: input.enabled,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: color),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: color),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: color),
            ),
            errorText: input.error,
            errorStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w400,
              fontSize: 10.0,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }

  Color get color {
    if (input.isInitial) {
      return Colors.black;
    }

    if (input.isValid) {
      return Colors.green;
    }

    return Colors.red;
  }
}
