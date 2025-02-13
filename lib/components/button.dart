import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  
  const Button(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Button'),
      ),
    );
  }
}