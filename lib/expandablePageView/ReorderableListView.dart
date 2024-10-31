import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home:  ReorderableListViewExample(),
      home:  ReorderableListExample(),
    );
  }
}


class ReorderableListExample extends StatefulWidget {
  const ReorderableListExample({super.key});

  @override
  _ReorderableListExampleState createState() => _ReorderableListExampleState();
}

class _ReorderableListExampleState extends State<ReorderableListExample> {
  final List<String> _items = List.generate(10, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: _onReorder,
      children: _items.map((item) => _buildListTile(context, item)).toList(),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  Widget _buildListTile(BuildContext context, String item) {
    return ListTile(
      key: ValueKey(item),
      title: Row(
        children: [
          ReorderableDragStartListener(
            index: _items.indexOf(item),
            child: Icon(Icons.drag_handle),
          ),
          SizedBox(width: 10),
          Text(item),
          Spacer(),
          Image.network(
            'https://via.placeholder.com/50',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}



class ReorderableListViewExample extends StatefulWidget {
  const ReorderableListViewExample({super.key});

  @override
  _ReorderableListViewExampleState createState() => _ReorderableListViewExampleState();
}

class _ReorderableListViewExampleState extends State<ReorderableListViewExample> {
  final List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable ListView'),
      ),
      body: ReorderableListView(
        children: _items.map((item) => ListTile(
          key: ValueKey(item),
          title: Text(item),
        )).toList(),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            debugPrint("_ReorderableListViewExampleState newIndex->$newIndex oldIndex ->$oldIndex");
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
