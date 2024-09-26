import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceApp(),
    ),
  );
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int diceTop = 1;
  int diceBottom = 1;

  @override
  Widget build(BuildContext context) {
    void rollDiceTop() {
      setState(() {
        diceTop = Random().nextInt(6) + 1;
      });
    }

    void rollDiceBottom() {
      setState(() {
        diceBottom = Random().nextInt(6) + 1;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Container(
                color: Colors.black87,
                child: const Center(
                  child: Text(
                    "DICE",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black87,
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () {
                              rollDiceTop();
                            },
                            child:
                                Image.asset('assets/images/dice$diceTop.png'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () {
                              rollDiceBottom();
                            },
                            child: Image.asset(
                                'assets/images/dice$diceBottom.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
