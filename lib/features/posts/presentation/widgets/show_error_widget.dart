import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  const new({super.key, required this.message});
  // error message
  final String message;

  @override
  Widget build(BuildContext context) {
    // Show error message in the center of the screen with red color
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
