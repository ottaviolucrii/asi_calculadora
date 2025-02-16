import 'package:calcu_ladora/components/display.dart';
import 'package:calcu_ladora/components/keyboard.dart';
import 'package:calcu_ladora/core/services/auth/auth_service.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(37, 37, 39, 1),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 77),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'Calculadora',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DropdownButtonHideUnderline(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DropdownButton(
                  icon: const Icon(
                    size: 32,
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'logout',
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.exit_to_app),
                            SizedBox(width: 10),
                            Text('Sair'),
                          ],
                        ),
                      ),
                    ),
                  ],
                  onChanged: (item) {
                    if (item == 'logout') {
                      AuthService().logout();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Display(memory.value),
            Keyboard(cb: _onPressed),
          ],
        ),
      ),
    );
  }
}
