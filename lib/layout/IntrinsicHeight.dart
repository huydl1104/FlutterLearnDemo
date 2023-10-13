import 'package:flutter/material.dart';

///用于将其子部件的高度调整为它们的最大自然高度，以保持一致。这在需要在一组子部件中具有相同高度的情况下非常有用，例如，如果你希望多个Text小部件具有相同的最大高度。
///创建一个小部件，将子部件的大小设置为子部件的固有宽度。这个类比较昂贵。尽可能避免使用它。
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyIntrinsicHeightExample2(),
    );
  }
}

class MyIntrinsicHeightExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IntrinsicHeight Example'),
      ),
      body: IntrinsicHeight(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Text('Short Text'),
            ),
            Container(
              color: Colors.green,
              child: Text('This is a longer text element'),
            ),
            Container(
              color: Colors.blue,
              child: Text('Another short text'),
            ),
          ],
        ),
      ),
    );
  }
}


class MyIntrinsicHeightExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IntrinsicHeight Example'),
      ),
      body: IntrinsicWidth(
        child: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Text('Short Text'),
            ),
            Container(
              color: Colors.green,
              child: Text('This is a longer element'),
            ),
            Container(
              color: Colors.blue,
              child: Text('Another short text'),
            ),
          ],
        ),
      ),
    );
  }
}
