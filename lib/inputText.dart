import 'package:flutter/material.dart';

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
    FocusScope.of(context).unfocus();
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
      ),
    );
  }
}
