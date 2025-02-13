import 'package:calcu_ladora/components/button_row.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          ButtonRow(buttons: [
            Button('AC', big: true),
            Button('%'),
            Button('/'),
          ]),
          ButtonRow(buttons: [
            Button('7'),
            Button('8'),
            Button('9'),
            Button('X'),
          ]),
          ButtonRow(buttons: [
            Button('4'),
            Button('5'),
            Button('6'),
            Button('-'),
          ]),
          ButtonRow(buttons: [
            Button('1'),
            Button('2'),
            Button('3'),
            Button('+'),
          ]),
          ButtonRow(buttons: [
            Button('0', big: true),
            Button(','),
            Button('='),
          ]),
        ],
      ),
    );
  }
}