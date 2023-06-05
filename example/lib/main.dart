import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValidationTextEditingController _emailController;
  late ValidationTextEditingController _passwordController;
  late ValidationTextEditingController _passwordConfirmationController;

  @override
  void initState() {
    _emailController = ValidationTextEditingController();
    _passwordController = ValidationTextEditingController();
    _passwordConfirmationController = ValidationTextEditingController();
    super.initState();
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to the real-time validator'),
        ),
        body: ValidationForm(
          onChanged: (bool passes) {
            if (passes) {
              log('The from can passes');
              return;
            }
            log('The from can\'t passes');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WrapTextField(
                  attribute: 'email',
                  controller: _emailController,
                  rules: [
                    IsRequired(customError: 'The email is required'),
                    IsEmail(),
                  ],
                  child: (input) {
                    return CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      input: input,
                      keyboardType: TextInputType.emailAddress,
                    );
                  },
                ),
                WrapTextField(
                  attribute: 'password',
                  controller: _passwordController,
                  rules: [
                    IsRequired(),
                    Password(min: 3),
                  ],
                  child: (input) {
                    return CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      input: input,
                      keyboardType: TextInputType.visiblePassword,
                    );
                  },
                ),
                WrapTextField(
                  attribute: 'password_confirmation',
                  controller: _passwordConfirmationController,
                  rules: [
                    IsRequired(),
                    Password(min: 3),
                    ConfirmedPassword('password'),
                  ],
                  child: (input) {
                    return CustomTextField(
                      controller: _passwordConfirmationController,
                      hintText: 'Password confirmation',
                      input: input,
                      keyboardType: TextInputType.visiblePassword,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: WrapButtonSubmit(
                    inputs: [
                      _emailController,
                      _passwordController,
                      _passwordConfirmationController,
                    ],
                    child: (ButtonFromData buttonFromData) {
                      return InkWell(
                        onTap: () {
                          if (!buttonFromData.isDisable) {
                            log('Login');
                            return;
                          }

                          log('Please fill the inputs first');
                        },
                        child: Container(
                          height: 58,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amber,
                          ),
                          alignment: Alignment.center,
                          child: const Text('Login'),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
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
    if (input.isInvalid) {
      return Colors.red;
    }

    if (input.isValid) {
      return Colors.green;
    }

    return Colors.black;
  }
}
