import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController(text: "0");
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';
  double? _result;

  final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin'];

  void _convert() {
    double input = double.tryParse(_controller.text) ?? 0;
    double convertedValue = input;

    Map<String, Map<String, double Function(double)>> conversionMap = {
      'Celsius': {
        'Fahrenheit': (temp) => (temp * 9 / 5) + 32,
        'Kelvin': (temp) => temp + 273.15,
      },
      'Fahrenheit': {
        'Celsius': (temp) => (temp - 32) * 5 / 9,
        'Kelvin': (temp) => (temp - 32) * 5 / 9 + 273.15,
      },
      'Kelvin': {
        'Celsius': (temp) => temp - 273.15,
        'Fahrenheit': (temp) => (temp - 273.15) * 9 / 5 + 32,
      }
    };

    if (_fromUnit != _toUnit) {
      convertedValue = conversionMap[_fromUnit]?[_toUnit]?.call(input) ?? input;
    }

    setState(() {
      _result = convertedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Temperatura', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 233, 153, 32),
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite a temperatura',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                _convert();
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(_fromUnit, (value) {
                  setState(() {
                    _fromUnit = value;
                    _convert();
                  });
                }),
                Icon(Icons.swap_horiz, color: Colors.white, size: 30),
                _buildDropdown(_toUnit, (value) {
                  setState(() {
                    _toUnit = value;
                    _convert();
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 233, 153, 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Converter', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _result == null ? 0.0 : 1.0,
              duration: Duration(milliseconds: 500),
              child: Text(
                _result == null ? '' : 'Resultado: ${_result!.toStringAsFixed(2)} $_toUnit',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String value, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: value,
        dropdownColor: Colors.grey[800],
        underline: SizedBox(),
        items: _units.map((unit) {
          return DropdownMenuItem(
            value: unit,
            child: Text(unit, style: TextStyle(color: Colors.white)),
          );
        }).toList(),
        onChanged: (newValue) {
          if (newValue != null) {
            onChanged(newValue);
          }
        },
      ),
    );
  }
}
