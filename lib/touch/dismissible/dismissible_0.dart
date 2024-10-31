import 'package:flutter/material.dart';

///一个小部件，可以通过在指定方向上拖动来取消。
void main() {
  runApp(const MyDismissibleApp());
}

class MyDismissibleApp extends StatelessWidget {
  const MyDismissibleApp({super.key});

  static const String _title = 'Widget Observer Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: WidgetDismissible(),
        ),
      ),
    );
  }
}

class WidgetDismissible extends StatefulWidget {
  const WidgetDismissible({Key? key}) : super(key: key);

  @override
  State<WidgetDismissible> createState() => _WidgetDismissibleState();
}

class _WidgetDismissibleState extends State<WidgetDismissible> {
  List<int> items = List<int>.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return Dismissible(
          background: Container(
            color: Colors.green,
          ),
          key: ValueKey<String>(items[index].toString()),
          onDismissed: (DismissDirection direction){
            setState(() {
              items.removeAt(index);
            });
          },
          child: ListTile(
            title: Text("Item ->${items[index]}"),
          ));
    });
  }
}
