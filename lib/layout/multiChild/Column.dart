import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyColumnExample2(),
    );
  }
}

class MyColumnExample extends StatelessWidget {
  const MyColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverflowBox Example'),
      ),
      body:  Column(
        children: const <Widget>[
          Text('Deliver features faster'),
          Text('Craft beautiful UIs'),
          Expanded(
            child: FittedBox(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyColumnExample2 extends StatelessWidget {
  const MyColumnExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OverflowBox Example'),
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //主轴应该占用多少空间。
          // mainAxisSize: MainAxisSize.min,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Text('We move under cover and we move as one'),
            const Text('Through the night, we have one shot to live another day'),
            const Text('We cannot let a stray gunshot give us away'),
            const Text('We will fight up close, seize the moment and stay in it'),
            const Text('It’s either that or meet the business end of a bayonet'),
            const Text('The code word is ‘Rochambeau,’ dig me?'),
            Text('Rochambeau!', style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0)),
          ],
        ),
      )
    );
  }
}

