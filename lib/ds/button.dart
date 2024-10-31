import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Respond to button press
      },
      child: const Text('Press me'),
    );
  }
}
