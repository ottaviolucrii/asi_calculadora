import 'package:flutter/material.dart';

import '../core/services/Utils/app_routes.dart';

class ConverterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(37, 37, 39, 1), // Define a cor de fundo aqui
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
Navigator.of(context, rootNavigator: true).pushNamed('/temperature_converter');
                        },
                        icon: const Icon(Icons.thermostat_rounded,
                            size: 35, color: Colors.white),
                      ),
                      const Text('Temperatura',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Adicione outros widgets aqui
        ],
      ),
    );
  }
}
