import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Background color
        onPrimary: Colors.white, // Text color
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
      ),
      onPressed: () {
        // Respond to button press
      },
      child: const Text('Press me'),
    );
  }
}
