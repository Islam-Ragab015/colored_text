import 'package:flutter/material.dart';

class GreetingPage extends StatelessWidget {
  final String name;
  final Color color;
  final String text;

  const GreetingPage(
      {super.key, required this.name, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting'),
      ),
      body: Center(
        child: Text(
          'Welcome $name, $text',
          style: TextStyle(fontSize: 24, color: color),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
