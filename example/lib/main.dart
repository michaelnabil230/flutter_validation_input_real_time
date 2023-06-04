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
          onChanged: (bool isPass) => print('Is pass $isPass'),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                WrapTextField(
                  name: 'email',
                  controller: _emailController,
                  rules: [
                    IsRequired(),
                    IsEmail(),
                  ],
                  textField: (input) {
                    return CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      input: input,
                      keyboardType: TextInputType.emailAddress,
                    );
                  },
                ),
                WrapTextField(
                  name: 'password',
                  controller: _passwordController,
                  rules: [
                    IsRequired(),
                    Password(min: 3),
                  ],
                  textField: (input) {
                    return CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      input: input,
                      keyboardType: TextInputType.visiblePassword,
                    );
                  },
                ),
                WrapTextField(
                  name: 'password_confirmation',
                  controller: _passwordConfirmationController,
                  rules: [
                    IsRequired(),
                    Password(min: 3),
                    ConfirmedPassword('password'),
                  ],
                  textField: (input) {
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
                  child: InkWell(
                    onTap: () {
                      print('Login');
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
          style: TextStyle(
            color: input.fails ? Colors.red : Colors.green,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: input.fails ? Colors.red : Colors.green,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: _getColor(input.passes)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: _getColor(input.passes)),
            ),
            errorText: input.errorMassage,
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

  Color _getColor(bool isPass) {
    if (!isPass) {
      return Colors.red;
    }

    return Colors.green;
  }
}
