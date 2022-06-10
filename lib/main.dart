import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mini_chat/app/app.dart';

Future<void> main() async {
  // Register all the models and services before the app starts
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

