import 'package:flutter/material.dart';

import 'package:sail_polar/pages/home.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}
