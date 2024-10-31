import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConstrainedBoxExample(),
    );
  }
}

class ConstrainedBoxExample extends StatelessWidget {
  const ConstrainedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConstrainedBox Example'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Container(
            width: 100,
            height: 100,
            color: Colors.lightBlue,
            child: const Card(child: Text('Hello World!'))),

      ),
    );
  }
}
