class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final splitNumbers = _splitInput(numbers);
    final parsedNumbers = _parse(splitNumbers);
    _validate(parsedNumbers);

    return parsedNumbers.reduce((a, b) => a + b);
  }

  List<String> _splitInput(String input) {
    String delimiter = ',';
    if (input.startsWith('//')) {
      final parts = input.split('\n');
      delimiter = parts[0].substring(2);
      input = parts.sublist(1).join('\n');
    }
    return input.split(RegExp('[$delimiter\n]'));
  }

  List<int> _parse(List<String> parts) =>
      parts.where((n) => n.trim().isNotEmpty).map(int.parse).toList();

  void _validate(List<int> numbers) {
    final negatives = numbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }
  }
}
