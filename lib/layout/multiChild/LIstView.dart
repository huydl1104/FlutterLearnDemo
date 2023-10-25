import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView 示例'),
        ),
        body: MYList3(),
      ),
    );
  }
}

class MYList3 extends StatelessWidget {
   MYList3({super.key});
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    //分割线
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}


class MyList2 extends StatelessWidget {
  MyList2({super.key});

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }
}
class MyList1 extends StatelessWidget {
  const MyList1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          height: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 100,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 100,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
        Container(
          height: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 100,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 100,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
        Container(
          height: 100,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 100,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
      ],
    );
  }
}