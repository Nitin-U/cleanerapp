import 'package:cleanerapp/custom_widget/transaction_route.dart';
import 'package:flutter/material.dart';

enum CleanerButtonType { elevated, outline, text, navigation }

class CleanerButton extends StatelessWidget {
  final CleanerButtonType type;
  final String label;
  final VoidCallback? onPressed;
  final Widget? destination;

  const CleanerButton.elevated({
    super.key,
    required this.label,
    required this.onPressed,
  })  : type = CleanerButtonType.elevated,
        destination = null;

  const CleanerButton.outline({
    super.key,
    required this.label,
    required this.onPressed,
  })  : type = CleanerButtonType.outline,
        destination = null;

  const CleanerButton.text({
    super.key,
    required this.label,
    required this.onPressed,
  })  : type = CleanerButtonType.text,
        destination = null;

  const CleanerButton.navigation({
    super.key,
    required this.label,
    required this.destination,
  })  : type = CleanerButtonType.navigation,
        onPressed = null;

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
      case CleanerButtonType.navigation:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.green, // Background color for Navigation Button
          ),
          onPressed: () {
            Navigator.push(context, CustomPageRoute(child: destination!));
          },
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        );
    }
  }
}
