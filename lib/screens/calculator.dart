import 'package:calcu_ladora/components/display.dart';
import 'package:calcu_ladora/components/keyboard.dart';
import 'package:calcu_ladora/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();
  void _onPressed(String text) {
    setState(() {
      memory.applyCommand(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: Column(
        children: [
          Display(memory.value),
          Keyboard(cb: _onPressed),
        ],
      ),
    );
  }
}