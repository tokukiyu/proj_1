import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String text = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void changeText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("hello flutter one"),
      ),
      body: Column(children: [InputW(changeText), Text(text)]),
    );
  }
}

class InputW extends StatefulWidget {
  final Function(String) callback;
  InputW(this.callback);

  @override
  State<InputW> createState() => _InputWState();
}

class _InputWState extends State<InputW> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the State object is disposed
    controller.dispose();
    super.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            onPressed: click,
          ),
          labelText: "Type a message:",
        ));
  }
}
