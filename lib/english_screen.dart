import 'package:flutter/material.dart';

class EnglishScreen extends StatefulWidget {
  const EnglishScreen({super.key});

  @override
  _EnglishScreenState createState() => _EnglishScreenState();
}

class _EnglishScreenState extends State<EnglishScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter a number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter number',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertToWords,
              child: const Text('Convert to Words'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Result:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _result,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _convertToWords() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _result = 'Please enter a number.';
      });
      return;
    }
    final number = double.tryParse(input);
    if (number == null || number < 0) {
      setState(() {
        _result = 'Invalid number. Enter a positive number.';
      });
      return;
    }

    setState(() {
      _result = _numberToWords(number);
    });
  }

  String _numberToWords(double number) {
    if (number == 0) return 'zero taka';

    final units = [
      '',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
    ];
    final teens = [
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];
    final tens = [
      '',
      'ten',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];

    String convertChunk(int n) {
      String result = '';
      if (n >= 100) {
        result += '${units[n ~/ 100]} hundred ';
        n %= 100;
      }
      if (n >= 11 && n <= 19) {
        result += '${teens[n - 11]} ';
      } else if (n >= 10) {
        result += '${tens[n ~/ 10]} ';
        n %= 10;
      }
      if (n > 0) {
        result += '${units[n]} ';
      }
      return result.trim();
    }

    String indianNumberSystemConversion(int n) {
      String result = '';
      int crore = n ~/ 10000000;
      n %= 10000000;
      int lakh = n ~/ 100000;
      n %= 100000;
      int thousand = n ~/ 1000;
      n %= 1000;
      int hundred = n;

      if (crore > 0) {
        result += '${convertChunk(crore)} crore ';
      }
      if (lakh > 0) {
        result += '${convertChunk(lakh)} lakh ';
      }
      if (thousand > 0) {
        result += '${convertChunk(thousand)} thousand ';
      }
      if (hundred > 0) {
        result += '${convertChunk(hundred)}';
      }
      return result.trim();
    }

    // Split the number into integer and fractional parts
    int integerPart = number.toInt();
    int fractionalPart = ((number - integerPart) * 100).toInt();

    String integerWords = indianNumberSystemConversion(integerPart);

    String result = '$integerWords taka';

    if (fractionalPart > 0) {
      String fractionalWords = indianNumberSystemConversion(fractionalPart);
      result += ' and $fractionalWords poisha';
    }

    return result;
  }
}
