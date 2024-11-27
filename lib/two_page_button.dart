import 'package:flutter/material.dart';

import 'bangla_screen.dart';
import 'english_screen.dart';

class TwoPageButton extends StatelessWidget {
  const TwoPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EnglishScreen()));
                },
                child: const Text('English')),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BanglaScreen()));
                },
                child: const Text('Bangla')),
          ],
        ),
      ),
    );
  }
}
