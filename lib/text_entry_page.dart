import 'package:flutter/material.dart';
import 'greeting_page.dart';

class TextEntryPage extends StatefulWidget {
  final String name;
  final Color color;

  const TextEntryPage({super.key, required this.name, required this.color});

  @override
  _TextEntryPageState createState() => _TextEntryPageState();
}

class _TextEntryPageState extends State<TextEntryPage> {
  final _textController = TextEditingController();

  void _proceedToGreeting() {
    if (_textController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GreetingPage(
            name: widget.name,
            color: widget.color,
            text: _textController.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
              decoration:
                  const InputDecoration(labelText: 'Enter your message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _proceedToGreeting,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
