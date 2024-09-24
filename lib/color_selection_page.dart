import 'package:flutter/material.dart';
import 'text_entry_page.dart';

class ColorSelectionPage extends StatefulWidget {
  final String name;

  const ColorSelectionPage({super.key, required this.name});

  @override
  _ColorSelectionPageState createState() => _ColorSelectionPageState();
}

class _ColorSelectionPageState extends State<ColorSelectionPage> {
  Color? _selectedColor;

  final Map<String, Color> _colors = {
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
  };

  void _selectColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  void _proceedToTextEntry() {
    if (_selectedColor != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TextEntryPage(
            name: widget.name,
            color: _selectedColor!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Color'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select a color:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: _colors.entries.map((entry) {
                return ChoiceChip(
                  label: Text(entry.key),
                  selected: _selectedColor == entry.value,
                  onSelected: (selected) {
                    _selectColor(entry.value);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _proceedToTextEntry,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
