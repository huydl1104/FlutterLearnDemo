import 'package:flutter/material.dart';

void main() => runApp(const InteractiveViewerExampleApp());

class InteractiveViewerExampleApp extends StatelessWidget {
  const InteractiveViewerExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('InteractiveViewer Sample')),
        body: const Align1(),
      ),
    );
  }
}

class Align1 extends StatelessWidget {
  const Align1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: const Align(
          alignment: Alignment.topRight,
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}

class Align2 extends StatelessWidget {
  const Align2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: const Align(
          alignment: Alignment(0.2, 0.6),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}

class Align3 extends StatelessWidget {
  const Align3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120.0,
        width: 120.0,
        color: Colors.blue[50],
        child: const Align(
          alignment: FractionalOffset(0.2, 0.6),
          child: FlutterLogo(
            size: 60,
          ),
        ),
      ),
    );
  }
}



