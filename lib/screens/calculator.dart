import 'package:calcu_ladora/components/display.dart';
import 'package:calcu_ladora/components/keyboard.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Display('1234'),
          Keyboard(),
        ],
      ),
    );
  }
}