import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class TestRule extends Rule {
  @override
  bool isValid(String input) => input.isNotEmpty;

  @override
  String toString() => throw UnimplementedError();
}

void main() {
  group('TestRule', () {
    test('should return true if the input is not empty', () {
      final rule = TestRule();

      expect(rule.isValid('hello'), isTrue);
      expect(rule.isValid('123'), isTrue);
      expect(rule.isValid(' '), isTrue);
    });

    test('should return false if the input is empty', () {
      final rule = TestRule();

      expect(rule.isValid(''), isFalse);
    });
  });
}
