import 'package:flutter/material.dart';
import 'package:spaced_repetition_app/core/styles/themes.dart';
import 'package:spaced_repetition_app/features/home_page/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      home: HomePage(),
    );
  }
}

