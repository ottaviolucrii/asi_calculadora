import 'package:flutter/material.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor'),
        backgroundColor: const Color.fromRGBO(37, 37, 39, 1),
      ),
      body: Center(
        child: Text(
          'Converter Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}