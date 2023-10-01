import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class TestRule extends Rule {
  TestRule({
    super.customValidationMessage,
  });

  @override
  bool isValid(String input) => input.isNotEmpty;

  @override
  String get name => 'test_rule';
}

void main() {
  group('TestRule', () {
    test('should return true if the input is not empty', () {
      final rule = TestRule()..initialization('hello', 'filed');

      expect(rule.isValid('hello'), isTrue);
      expect(rule.isValid('123'), isTrue);
      expect(rule.isValid(' '), isTrue);
    });

    test('should return false if the input is empty', () {
      final rule = TestRule()..initialization('hello', 'filed');

      expect(rule.isValid(''), isFalse);
    });

    test('test custom error', () {
      final rule =
          TestRule(customValidationMessage: (_) => 'This is custom error')
            ..initialization('hello', 'filed');

      expect(rule.toString(), 'This is custom error');
    });
  });
}
