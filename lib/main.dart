import 'package:flutter/material.dart';

class ColoredSquare extends StatelessWidget {
  final Color borderColor;

  ColoredSquare({required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Widget Example'),
        ),
        body: Center(
          child: ColoredSquare(borderColor: Colors.blue),
        ),
      ),
    ),
  );
}
