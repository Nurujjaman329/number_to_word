//import 'package:flutter/material.dart';

//void main() {
//  runApp(const NumberToWordsApp());
//}

//class NumberToWordsApp extends StatelessWidget {
//  const NumberToWordsApp({super.key});

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Number to Words',
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Number to Words Converter'),
//        ),
//        body: const NumberToWordsScreen(),
//      ),
//    );
//  }
//}

//class NumberToWordsScreen extends StatefulWidget {
//  const NumberToWordsScreen({super.key});

//  @override
//  _NumberToWordsScreenState createState() => _NumberToWordsScreenState();
//}

//class _NumberToWordsScreenState extends State<NumberToWordsScreen> {
//  final TextEditingController _controller = TextEditingController();
//  String _result = '';

//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(16.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          const Text(
//            'Enter a number:',
//            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//          ),
//          const SizedBox(height: 8),
//          TextField(
//            controller: _controller,
//            keyboardType: TextInputType.numberWithOptions(decimal: true),
//            decoration: const InputDecoration(
//              border: OutlineInputBorder(),
//              hintText: 'Enter number',
//            ),
//          ),
//          const SizedBox(height: 16),
//          ElevatedButton(
//            onPressed: _convertToWords,
//            child: const Text('Convert to Words'),
//          ),
//          const SizedBox(height: 16),
//          const Text(
//            'Result:',
//            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//          ),
//          const SizedBox(height: 8),
//          Text(
//            _result,
//            style: const TextStyle(fontSize: 16),
//          ),
//        ],
//      ),
//    );
//  }

//  void _convertToWords() {
//    final input = _controller.text.trim();
//    if (input.isEmpty) {
//      setState(() {
//        _result = 'Please enter a number.';
//      });
//      return;
//    }
//    final number = double.tryParse(input);
//    if (number == null || number < 0) {
//      setState(() {
//        _result = 'Invalid number. Enter a positive number.';
//      });
//      return;
//    }

//    setState(() {
//      _result = _numberToWords(number);
//    });
//  }

//  String _numberToWords(double number) {
//    if (number == 0) return 'zero taka';

//    final units = [
//      '',
//      'one',
//      'two',
//      'three',
//      'four',
//      'five',
//      'six',
//      'seven',
//      'eight',
//      'nine'
//    ];
//    final teens = [
//      'eleven',
//      'twelve',
//      'thirteen',
//      'fourteen',
//      'fifteen',
//      'sixteen',
//      'seventeen',
//      'eighteen',
//      'nineteen'
//    ];
//    final tens = [
//      '',
//      'ten',
//      'twenty',
//      'thirty',
//      'forty',
//      'fifty',
//      'sixty',
//      'seventy',
//      'eighty',
//      'ninety'
//    ];

//    String convertChunk(int n) {
//      String result = '';
//      if (n >= 100) {
//        result += '${units[n ~/ 100]} hundred ';
//        n %= 100;
//      }
//      if (n >= 11 && n <= 19) {
//        result += '${teens[n - 11]} ';
//      } else if (n >= 10) {
//        result += '${tens[n ~/ 10]} ';
//        n %= 10;
//      }
//      if (n > 0) {
//        result += '${units[n]} ';
//      }
//      return result.trim();
//    }

//    String indianNumberSystemConversion(int n) {
//      String result = '';
//      int crore = n ~/ 10000000;
//      n %= 10000000;
//      int lakh = n ~/ 100000;
//      n %= 100000;
//      int thousand = n ~/ 1000;
//      n %= 1000;
//      int hundred = n;

//      if (crore > 0) {
//        result += '${convertChunk(crore)} crore ';
//      }
//      if (lakh > 0) {
//        result += '${convertChunk(lakh)} lakh ';
//      }
//      if (thousand > 0) {
//        result += '${convertChunk(thousand)} thousand ';
//      }
//      if (hundred > 0) {
//        result += '${convertChunk(hundred)}';
//      }
//      return result.trim();
//    }

//    // Split the number into integer and fractional parts
//    int integerPart = number.toInt();
//    int fractionalPart = ((number - integerPart) * 100).toInt();

//    String integerWords = indianNumberSystemConversion(integerPart);

//    String result = '$integerWords taka';

//    if (fractionalPart > 0) {
//      String fractionalWords = indianNumberSystemConversion(fractionalPart);
//      result += ' and $fractionalWords poisha';
//    }

//    return result;
//  }
//}

//import 'package:flutter/material.dart';

//void main() {
//  runApp(const NumberToWordsApp());
//}

//class NumberToWordsApp extends StatelessWidget {
//  const NumberToWordsApp({super.key});

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Number to Bangla Words',
//      home: Scaffold(
//        appBar: AppBar(
//          title:
//              const Text('সংখ্যা থেকে কথায় রূপান্তর (Number to Bangla Words)'),
//        ),
//        body: const NumberToWordsScreen(),
//      ),
//    );
//  }
//}

//class NumberToWordsScreen extends StatefulWidget {
//  const NumberToWordsScreen({super.key});

//  @override
//  _NumberToWordsScreenState createState() => _NumberToWordsScreenState();
//}

//class _NumberToWordsScreenState extends State<NumberToWordsScreen> {
//  final TextEditingController _controller = TextEditingController();
//  String _result = '';

//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(16.0),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          const Text(
//            'সংখ্যা লিখুন:',
//            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//          ),
//          const SizedBox(height: 8),
//          TextField(
//            controller: _controller,
//            keyboardType: TextInputType.numberWithOptions(decimal: true),
//            decoration: const InputDecoration(
//              border: OutlineInputBorder(),
//              hintText: 'সংখ্যা লিখুন (Enter number)',
//            ),
//          ),
//          const SizedBox(height: 16),
//          ElevatedButton(
//            onPressed: _convertToWords,
//            child: const Text('রূপান্তর করুন (Convert)'),
//          ),
//          const SizedBox(height: 16),
//          const Text(
//            'ফলাফল:',
//            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//          ),
//          const SizedBox(height: 8),
//          Text(
//            _result,
//            style: const TextStyle(fontSize: 16),
//          ),
//        ],
//      ),
//    );
//  }

//  void _convertToWords() {
//    final input = _controller.text.trim();
//    if (input.isEmpty) {
//      setState(() {
//        _result = 'দয়া করে একটি সংখ্যা লিখুন।';
//      });
//      return;
//    }

//    final number = double.tryParse(input);
//    if (number == null || number < 0) {
//      setState(() {
//        _result = 'অবৈধ সংখ্যা। একটি সঠিক সংখ্যা লিখুন।';
//      });
//      return;
//    }

//    setState(() {
//      _result = _numberToWordsWithDecimal(number);
//    });
//  }

//  String _numberToWordsWithDecimal(double number) {
//    int integerPart = number.floor();
//    int decimalPart =
//        ((number - integerPart) * 100).round(); // Two decimal places

//    String integerPartInWords = _numberToWords(integerPart);
//    String decimalPartInWords = _numberToWords(decimalPart);

//    if (decimalPart > 0) {
//      return '$integerPartInWords টাকা $decimalPartInWords পয়সা মাত্র';
//    }
//    return '$integerPartInWords টাকা মাত্র';
//  }

//  String _numberToWords(int number) {
//    if (number == 0) return 'শূন্য';

//    // Number words from 1 to 100
//    final numberWords = {
//      1: "এক",
//      2: "দুই",
//      3: "তিন",
//      4: "চার",
//      5: "পাঁচ",
//      6: "ছয়",
//      7: "সাত",
//      8: "আট",
//      9: "নয়",
//      10: "দশ",
//      11: "এগারো",
//      12: "বারো",
//      13: "তেরো",
//      14: "চৌদ্দ",
//      15: "পনেরো",
//      16: "ষোল",
//      17: "সতেরো",
//      18: "আঠারো",
//      19: "উনিশ",
//      20: "বিশ",
//      21: "একুশ",
//      22: "বাইশ",
//      23: "তেইশ",
//      24: "চব্বিশ",
//      25: "পঁচিশ",
//      26: "ছাব্বিশ",
//      27: "সাতাশ",
//      28: "আটাশ",
//      29: "ঊনত্রিশ",
//      30: "ত্রিশ",
//      31: "একত্রিশ",
//      32: "বত্রিশ",
//      33: "তেত্রিশ",
//      34: "চৌত্রিশ",
//      35: "পঁইত্রিশ",
//      36: "ছত্রিশ",
//      37: "সাঁইত্রিশ",
//      38: "আটত্রিশ",
//      39: "ঊনচল্লিশ",
//      40: "চল্লিশ",
//      41: "একচল্লিশ",
//      42: "বিয়াল্লিশ",
//      43: "তেতাল্লিশ",
//      44: "চুয়াল্লিশ",
//      45: "পঁইতাল্লিশ",
//      46: "ছেচল্লিশ",
//      47: "সাতচল্লিশ",
//      48: "আটচল্লিশ",
//      49: "ঊনপঞ্চাশ",
//      50: "পঞ্চাশ",
//      51: "একান্ন",
//      52: "বাহান্ন",
//      53: "তিপ্পান্ন",
//      54: "চুয়ান্ন",
//      55: "পঞ্চান্ন",
//      56: "ছাপ্পান্ন",
//      57: "সাতান্ন",
//      58: "আটান্ন",
//      59: "ঊনষাট",
//      60: "ষাট",
//      61: "একষট্টি",
//      62: "বাষট্টি",
//      63: "তেষট্টি",
//      64: "চৌষট্টি",
//      65: "পঁইষট্টি",
//      66: "ছেষট্টি",
//      67: "সাতষট্টি",
//      68: "আটষট্টি",
//      69: "ঊনসত্তর",
//      70: "সত্তর",
//      71: "একাত্তর",
//      72: "বাহাত্তর",
//      73: "তিয়াত্তর",
//      74: "চুয়াত্তর",
//      75: "পঁচাত্তর",
//      76: "ছিয়াত্তর",
//      77: "সাতাত্তর",
//      78: "আটাত্তর",
//      79: "ঊনআশি",
//      80: "আশি",
//      81: "একাশি",
//      82: "বিরাশি",
//      83: "তিরাশি",
//      84: "চুরাশি",
//      85: "পঁচাশি",
//      86: "ছিয়াশি",
//      87: "সাতাশি",
//      88: "অষ্টআশি",
//      89: "ঊননব্বই",
//      90: "নব্বই",
//      91: "একানব্বই",
//      92: "বিরানব্বই",
//      93: "তিরানব্বই",
//      94: "চুরানব্বই",
//      95: "পঁচানব্বই",
//      96: "ছিয়ানব্বই",
//      97: "সাতানব্বই",
//      98: "আটানব্বই",
//      99: "নিরানব্বই",
//      100: "একশ"
//    };

//    String convertChunk(int n) {
//      if (n <= 100) {
//        return numberWords[n] ?? '';
//      }

//      String result = '';
//      if (n >= 100) {
//        int hundreds = n ~/ 100;
//        result += '${numberWords[hundreds]} শত ';
//        n %= 100;
//      }
//      if (n > 0) {
//        result += numberWords[n] ?? '';
//      }
//      return result.trim();
//    }

//    String indianNumberSystemConversion(int n) {
//      String result = '';
//      int crore = n ~/ 10000000;
//      n %= 10000000;
//      int lakh = n ~/ 100000;
//      n %= 100000;
//      int thousand = n ~/ 1000;
//      n %= 1000;
//      int hundred = n;

//      if (crore > 0) {
//        result += '${convertChunk(crore)} কোটি ';
//      }
//      if (lakh > 0) {
//        result += '${convertChunk(lakh)} লক্ষ ';
//      }
//      if (thousand > 0) {
//        result += '${convertChunk(thousand)} হাজার ';
//      }
//      if (hundred > 0) {
//        result += '${convertChunk(hundred)}';
//      }
//      return result.trim();
//    }

//    return indianNumberSystemConversion(number);
//  }
//}
