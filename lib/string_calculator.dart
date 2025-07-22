class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      numbers = parts.sublist(1).join('\n');
    }

    final splitNumbers = numbers.split(RegExp('[$delimiter\n]'));

    final parsedNumbers = splitNumbers
        .where((n) => n.trim().isNotEmpty)
        .map(int.parse)
        .toList();

    final negatives = parsedNumbers.where((n) => n < 0).toList();
    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

    return parsedNumbers.reduce((a, b) => a + b);
  }
}
