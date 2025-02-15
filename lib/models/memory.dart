class Memory {

  static const operations = ['%', '/', 'x', '-', '+', '='];


  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  late String operation;
  String _value = '0';
  bool _whipeValue = false;


  String get value{
    return _value;
  }


  void applyCommand(String command) {
    if(command  == 'AC') {
      _allClear();
    } else if(operations.contains(command)) {
      _setOperation(command);
    }
    else {
      _addDigit(command);
    }
  }

  _addDigit (String digit){
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _whipeValue;
    if(isDot && _value.contains('.') && !wipeValue) {
      return;
    }
    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _whipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _calculate () {
    switch(operation){
      case '%': return _buffer[0] % _buffer[1];
      case '/': return _buffer[0] / _buffer[1];
      case 'x': return _buffer[0] * _buffer[1];
      case '-': return _buffer[0] - _buffer[1];
      case '+': return _buffer[0] + _buffer[1];
      default: return _buffer[0];
    }
  }

  _setOperation(String newOperation){
    if(_bufferIndex == 0){
      operation = newOperation;
      _bufferIndex = 1;
      _whipeValue = true;
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;

      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
      operation = newOperation;
      _bufferIndex = 1;
    }
  }

  void _allClear() {
    _value = '0';
  }
}