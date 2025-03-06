import 'package:flutter/material.dart';

enum CleanerButtonType { elevated, outline, text }

class CleanerButton extends StatelessWidget {
  final CleanerButtonType type;
  final String label;
  final VoidCallback onPressed;

  const CleanerButton.elevated({
    super.key,
    required this.label,
    required this.onPressed,
  }) : type = CleanerButtonType.elevated;

  const CleanerButton.outline({
    super.key,
    required this.label,
    required this.onPressed,
  }) : type = CleanerButtonType.outline;

  const CleanerButton.text({
    super.key,
    required this.label,
    required this.onPressed,
  }) : type = CleanerButtonType.text;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CleanerButtonType.elevated:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Background color for ElevatedButton
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white), // Text color for ElevatedButton
          ),
        );
      case CleanerButtonType.outline:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
                color: Colors.blue), // Border color for OutlinedButton
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.blue), // Text color for OutlinedButton
          ),
        );
      case CleanerButtonType.text:
        return TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue, // Text color for TextButton
          ),
          onPressed: onPressed,
          child: Text(label),
        );
    }
  }
}
