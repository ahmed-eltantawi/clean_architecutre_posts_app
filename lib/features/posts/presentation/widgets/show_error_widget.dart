import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  const new({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
