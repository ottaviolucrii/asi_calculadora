import 'package:calcu_ladora/firebase_options.dart';
import 'package:calcu_ladora/screens/auth_or_app_page.dart';
import 'package:calcu_ladora/screens/converter_screen.dart';
import 'package:calcu_ladora/screens/temperature_converter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/services/Utils/app_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Calculadora());
}

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: const AuthOrAppPage(),
      debugShowCheckedModeBanner: false,
      title: 'Asi - calculator',
      routes: {
        AppRoutes.TEMP_CONVERT: (context) => TemperatureConverter(),
        AppRoutes.CONVERT_SCREEN: (context) =>  ConverterScreen(),
      },
    );
  }
}
