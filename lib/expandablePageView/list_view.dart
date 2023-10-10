import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<dynamic> items = [
    {'type': 'header', 'text': 'Header Item'},
    {'type': 'text', 'text': 'Text Item 1'},
    {'type': 'text', 'text': 'Text Item 2'},
    {'type': 'image', 'imageUrl': 'https://example.com/image.jpg'},
    // 添加其他类型的 item
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Different Item Types'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          switch (item['type']) {
            case 'header':
              return HeaderItem(text: item['text']);
            case 'text':
              return TextItem(text: item['text']);
            case 'image':
              return ImageItem(imageUrl: item['imageUrl']);
          // 添加其他类型的 item
            default:
              return Container(); // 默认情况下返回一个空容器
          }
        },
      ),
    );
  }
}

class HeaderItem extends StatelessWidget {
  final String text;

  HeaderItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class TextItem extends StatelessWidget {
  final String text;

  TextItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}

class ImageItem extends StatelessWidget {
  final String imageUrl;

  ImageItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageUrl),
    );
  }
}
