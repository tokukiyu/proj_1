import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  String _disp = '';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = '';

  void _onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      _clear();
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      _setOperator(buttonText);
    } else if (buttonText == '=') {
      _calculateResult();
    } else {
      _appendDigit(buttonText);
    }
  }

  void _clear() {
    setState(() {
      _output = '';
      _num1 = 0.0;
      _num2 = 0.0;
      _operator = '';
      _disp = '';
    });
  }

  void _setOperator(String operator) {
    setState(() {
      _operator = operator;
      _num1 = double.parse(_output);
      _disp = _output + _operator;
      _output = '';
    });
  }

  void _appendDigit(String digit) {
    setState(() {
      _output += digit;
    });
  }

  void _calculateResult() {
    setState(() {
      _num2 = double.parse(_output);

      switch (_operator) {
        case '+':
          _output = (_num1 + _num2).toString();
          break;
        case '-':
          _output = (_num1 - _num2).toString();
          break;
        case '*':
          _output = (_num1 * _num2).toString();
          break;
        case '/':
          _output = (_num1 / _num2).toString();
          break;
      } 
 
      _num1 = double.parse(_output);
      _operator = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                _disp,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: CalculatorButtons(onButtonPressed: _onButtonPressed),
          ),
        ],
      ),
    );
  }
}

class CalculatorButtons extends StatelessWidget {
  final Function(String) onButtonPressed;

  CalculatorButtons({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(['7', '8', '9', '/']),
        _buildRow(['4', '5', '6', '*']),
        _buildRow(['1', '2', '3', '-']),
        _buildRow(['C', '0', '=', '+']),
      ],
    );
  }


  Widget _buildRow(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons
            .map((buttonText) => CalculatorButton(
                  text: buttonText,
                  onPressed: () => onButtonPressed(buttonText),
                ))
            .toList(),
      ),
    );
  }

}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CalculatorButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

}
