import 'package:calcu_ladora/components/display.dart';
import 'package:calcu_ladora/components/keyboard.dart';
import 'package:calcu_ladora/core/services/auth/auth_service.dart';
import 'package:calcu_ladora/models/memory.dart';
import 'package:calcu_ladora/screens/converter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onPressed(String text) {
    setState(() {
      memory.applyCommand(text);
    });
  }

  void _navigateToPage(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
          backgroundColor: const Color.fromRGBO(37, 37, 39, 1),
          actions: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () => _navigateToPage(0),
                    style: TextButton.styleFrom(
                      foregroundColor: _selectedIndex == 0 ? Colors.orange : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calculate,
                          color: _selectedIndex == 0 ? Colors.orange : Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Calculadora',
                          style: TextStyle(
                            fontSize: 20,
                            color: _selectedIndex == 0 ? Colors.orange : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => _navigateToPage(1),
                    style: TextButton.styleFrom(
                      foregroundColor: _selectedIndex == 1 ? Colors.orange : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.swap_horiz,
                          color: _selectedIndex == 1 ? Colors.orange : Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Conversor',
                          style: TextStyle(
                            fontSize: 20,
                            color: _selectedIndex == 1 ? Colors.orange : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      icon: const Icon(
                        Icons.more_vert,
                        size: 32,
                        color: Colors.white,
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'logout',
                          child: Row(
                            children: const [
                              Icon(Icons.exit_to_app),
                              SizedBox(width: 10),
                              Text('Sair'),
                            ],
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
                ],
              ),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Column(
              children: [
                Display(memory.value),
                Keyboard(cb: _onPressed),
              ],
            ),
            const ConverterScreen(),
          ],
        ),
      ),
    );
  }
}