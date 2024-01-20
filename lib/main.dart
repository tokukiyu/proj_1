import 'package:proj_1/calculator.dart';
import 'package:proj_1/login.dart';

import './homePage.dart';

import 'package:flutter/material.dart';

void main() {
  runApp( CalculatorApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 42, 101, 230)), 
        useMaterial3: true,
      ),
      home: LoginPage(), 
    ); 
  }
}
 