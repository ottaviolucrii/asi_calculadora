import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool big;
  
  const Button(this.text, {super.key, this.big = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Button'),
      ),
    );
  }
}