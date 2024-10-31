import 'package:flutter/material.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Example'),
        ),
        body: Center(
          child: PopupMenuButtonExample(),
        ),
      ),
    );
  }
}

class PopupMenuButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<int>(
        onSelected: (int result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Selected: $result')),
          );
        },
        offset: Offset(20, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
          PopupMenuItem<int>(
            value: 1,
            child: Text('Settings'),
          ),
          PopupMenuDivider(height: 2,),
          PopupMenuItem<int>(
            value: 2,
            child: Text('Settings'),
          ),
          PopupMenuDivider(),
          PopupMenuItem<int>(
            value: 3,
            child: Text('Logout'),
          ),
        ],
        child: Container(
          width: 80,
          height: 50,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text("asdasdasd"),
        ),
      ),
    );
  }
}
