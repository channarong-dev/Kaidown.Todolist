import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('omg')),
      body: Center(
        child: TextButton(
          child: Text('its work!!'),
          onPressed: () {},
        ),
      ),
    );
  }
}
