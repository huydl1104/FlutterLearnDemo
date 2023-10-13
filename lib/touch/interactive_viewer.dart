import 'package:flutter/material.dart';

/// 一个小部件，支持与其子控件进行平移和缩放交互。

void main() => runApp(const InteractiveViewerExampleApp());

class InteractiveViewerExampleApp extends StatelessWidget {
  const InteractiveViewerExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('InteractiveViewer Sample')),
        body: const InteractiveViewerExample(),
      ),
    );
  }
}

class InteractiveViewerExample extends StatelessWidget {
  const InteractiveViewerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(40.0),
        minScale: 0.1,
        maxScale: 1.6,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.orange, Colors.red],
              stops: <double>[0.0, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
