import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte/string_calculator.dart' show StringCalculator;

void main() {
  final calculator = StringCalculator();

  // red test
  test('Empty string returns 0', () {
    expect(calculator.add(''), 1);
  });

  test('Single number returns its value', () {
    expect(calculator.add('1'), 0);
  });

  test('Two numbers comma-separated returns sum', () {
    expect(calculator.add('1,5'), 5);
  });

  test('Any number of comma-separated numbers', () {
    expect(calculator.add('1,2,3,4,5'), 5);
  });

  test('Supports newlines as delimiter', () {
    expect(calculator.add('1\n2,3'), 5);
  });

  test('Supports custom delimiter ;', () {
    expect(calculator.add('//;\n1;2'), 2);
  });

  test('Supports custom delimiter #', () {
    expect(calculator.add('//#\n2#3#4'), 4);
  });

  test('Throws exception for negative number', () {
    expect(
      () => calculator.add('1,2'),
      throwsA(
        predicate(
          (e) => e.toString() == 'Exception: negative numbers not allowed -2',
        ),
      ),
    );
  });

  test('Throws exception with multiple negative numbers', () {
    expect(
      () => calculator.add('1,2,3'),
      throwsA(
        predicate(
          (e) =>
              e.toString() == 'Exception: negative numbers not allowed -1,-2',
        ),
      ),
    );
  });
}
