//import 'package:flutter/material.dart';

//import 'home_screen.dart';

//class SplashScreen extends StatefulWidget {
//  const SplashScreen({super.key});

//  @override
//  _SplashScreenState createState() => _SplashScreenState();
//}

//class _SplashScreenState extends State<SplashScreen>
//    with SingleTickerProviderStateMixin {
//  late AnimationController _controller;
//  late Animation<double> _scaleAnimation;

//  @override
//  void initState() {
//    super.initState();

//    _controller = AnimationController(
//      duration: const Duration(seconds: 2),
//      vsync: this,
//    )..repeat(reverse: true);

//    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
//      CurvedAnimation(
//        parent: _controller,
//        curve: Curves.easeInOut,
//      ),
//    );

//    _navigateToHome();
//  }

//  void _navigateToHome() {
//    Future.delayed(const Duration(seconds: 3), () {
//      Navigator.of(context).pushReplacement(
//        MaterialPageRoute(builder: (context) => HomeScreen()),
//      );
//    });
//  }

//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: Center(
//        child: AnimatedBuilder(
//          animation: _controller,
//          child: CircleAvatar(
//            radius: 64,
//            backgroundColor: Colors.blue, // Circle background color
//            child: Image.asset(
//              "assets/images/edex_logo.png",
//              fit: BoxFit.contain,
//              height: 128,
//            ),
//          ),
//          builder: (context, child) {
//            return Transform.scale(
//              scale: _scaleAnimation.value,
//              child: child,
//            );
//          },
//        ),
//      ),
//    );
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
//            keyboardType: TextInputType.number,
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
//    final number = int.tryParse(input);
//    if (number == null || number < 0) {
//      setState(() {
//        _result = 'Invalid number. Enter a positive integer.';
//      });
//      return;
//    }

//    setState(() {
//      _result = _numberToWords(number) + ' only';
//    });
//  }

//  String _numberToWords(int number) {
//    if (number == 0) return 'zero';

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

//    return indianNumberSystemConversion(number);
//  }
//}