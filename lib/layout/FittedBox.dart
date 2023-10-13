import 'package:flutter/material.dart';

/// 根据适合度对其子在自身内部进行缩放和定位

void main() => runApp(const FittedBoxApp());

class FittedBoxApp extends StatelessWidget {
  const FittedBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FittedBox Sample')),
        body: const Center(
          child: FittedBoxExample(),
        ),
      ),
    );
  }
}

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.blue,
      child: const FittedBox(
        // TRY THIS: Try changing the fit types to see how they change the way
        // the placeholder fits into the container.
        fit: BoxFit.fill,
        child: Placeholder(),
      ),
    );
  }
}
