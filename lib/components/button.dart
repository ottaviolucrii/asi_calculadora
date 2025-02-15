import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool big;
  final Color color;
  final void Function (String) cb;

  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(18, 18, 18, 1);
  static const OPERATION = Color.fromRGBO(255, 149, 0, 1);

  const Button(
    this.text, {super.key, 
    this.big = false,
    this.color = DEFAULT,
    required this.cb,
  });
  const Button.big(
    this.text, {super.key, 
    this.big = true,
    this.color = DEFAULT,
    required this.cb,
  });
  const Button.operation(
    this.text, {super.key, 
    this.big = false,
    this.color = OPERATION,
    required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: this.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () => cb(text),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
