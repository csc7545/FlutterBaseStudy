import 'package:flutter/material.dart';
import 'package:feature_home/feature_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Module App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FeatureHomeScreen(),
    );
  }
}
