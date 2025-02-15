import 'package:calcu_ladora/components/button_row.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  final void Function (String) cb;

  const Keyboard({super.key, required this.cb});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          ButtonRow(buttons: [
            Button.big('AC',color: Button.DARK, cb : cb),
            Button.operation('%', color: Button.DARK ,cb : cb),
            Button.operation('/', cb : cb),
          ]),
          SizedBox(height: 1),
          ButtonRow(buttons: [
            Button('7', cb : cb),
            Button('8', cb : cb),
            Button('9', cb : cb),
            Button.operation('x', cb : cb),
          ]),
          SizedBox(height: 1),
          ButtonRow(buttons: [
            Button('4', cb : cb),
            Button('5', cb : cb),
            Button('6', cb : cb),
            Button.operation('-', cb : cb),
          ]),
          SizedBox(height: 1),
          ButtonRow(buttons: [
            Button('1', cb : cb),
            Button('2', cb : cb),
            Button('3', cb : cb),
            Button.operation('+', cb : cb),
          ]),
          SizedBox(height: 1),
          ButtonRow(buttons: [
            Button.big('0', cb : cb),
            Button.operation(',', cb : cb),
            Button.operation('=', cb : cb),
          ]),
        ],
      ),
    );
  }
}