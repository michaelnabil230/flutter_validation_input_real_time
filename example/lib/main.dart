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

  @override
  void initState() {
    _emailController = ValidationTextEditingController();
    _passwordController = ValidationTextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          onChanged: (bool isPass) {
            print('Is pass $isPass');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFieldCustom(
                  name: 'email',
                  hintText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  rules: [
                    IsRequired(),
                    IsEmail(),
                  ],
                ),
                TextFieldCustom(
                  name: 'password',
                  hintText: 'Password',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  rules: [
                    IsRequired(),
                    RangeLength(min: 8, max: 12),
                  ],
                ),
                InkWell(
                  onTap: () {
                    print('Login');
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.amber,
                    alignment: Alignment.center,
                    child: const Text('Login'),
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
