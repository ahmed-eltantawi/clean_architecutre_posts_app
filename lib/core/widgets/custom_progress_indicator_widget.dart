import 'package:clean_architecutre_posts_app/core/app_theme.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: secondaryColor));
  }
}
