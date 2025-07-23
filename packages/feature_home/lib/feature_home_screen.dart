import 'package:flutter/material.dart';
import 'package:shared_ui/heading.dart';

class FeatureHomeScreen extends StatelessWidget {
  const FeatureHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feature Home')),
      body: const Center(
        child: Heading(text: 'Hello from Feature Module!'),
      ),
    );
  }
}
