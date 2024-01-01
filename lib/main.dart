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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("hello flutter one"),
      ),
      body: InputW(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class InputW extends StatefulWidget {
  const InputW({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: this.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message:",
        ),
      ),
      TextField(
        controller: this.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "controller.text",
        ),
      )
    ]);
  }
}
