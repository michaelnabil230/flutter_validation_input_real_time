import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/classes/input.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('ConfirmedPassword', () {
    test('should return true if the password matches the confirmed password',
        () {
      final rule = ConfirmedPassword('password');

      final inputs = [
        const Input(attribute: 'password', value: 'Password123', rules: []),
        const Input(
            attribute: 'confirmPassword', value: 'Password123', rules: []),
      ];

      rule.initialization(inputs, 'password');

      expect(rule.isValid('Password123'), isTrue);
    });

    test(
        'should return false if the password does not match the confirmed password',
        () {
      final rule = ConfirmedPassword('password');

      final inputs = [
        const Input(attribute: 'password', value: 'Password123', rules: []),
        const Input(
            attribute: 'confirmPassword', value: 'Password456', rules: []),
      ];

      rule.initialization(inputs, 'password');

      expect(rule.isValid('Password456'), isFalse);
    });

    test(
        'should return false if the input name is not found in the inputs list',
        () {
      final rule = ConfirmedPassword('password');

      final inputs = [
        const Input(attribute: 'username', value: 'john_doe', rules: []),
        const Input(attribute: 'email', value: 'john@example.com', rules: []),
      ];

      rule.initialization(inputs, 'password');

      expect(rule.isValid('Password123'), isFalse);
    });
  });
}
