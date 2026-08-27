import 'package:clean_architecutre_posts_app/app.dart';
import 'package:clean_architecutre_posts_app/config/services/services_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}
