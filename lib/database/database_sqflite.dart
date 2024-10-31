import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDatabaseExample(),
    );
  }
}

class MyDatabaseExample extends StatefulWidget {
  const MyDatabaseExample({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyDatabaseState();
  }
}

class _MyDatabaseState extends State<MyDatabaseExample>{
  Database? _database;
  int _VERSION = 1;
  String _NAME = "test.db";

  void open() async {}

  ///初始化
  void init() async {
     var databasesPath = await getDatabasesPath();
     String path = join(databasesPath, _NAME);
     _database = await openDatabase(path,
         version: _VERSION, onCreate: (Database db, int version) async {}, onUpgrade: _onUpgrade);
     await _database?.execute(
         'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)'
     );

  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async{

  }

  insert() async {
    int? id = await _database?.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)'
    );
    debugPrint("insert data ->$id");
  }

  delete()async{
    int? count = await _database?.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
    debugPrint("delete delete ->$count");
  }

  query()async{
    List<Map>? list = await _database?.rawQuery('SELECT * FROM Test');
    list?.forEach((element) {
       final value = element['name'];
       debugPrint("query  value->$value");
    });
  }

  updateData()async{
    int? count = await _database?.rawUpdate(
        'UPDATE Test SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']
    );
    debugPrint("updateData  count->$count");
  }

  close()async{
    _database?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('database Example'),
        ),
        body:Center(
          child: Column(
            children: [
                TextButton(onPressed: (){ insert(); }, child: Text("插入数据")),
                TextButton(onPressed: (){ delete(); }, child: Text("删除数据")),
                TextButton(onPressed: (){ query(); }, child: Text("查询数据")),
                TextButton(onPressed: (){ close(); }, child: Text("关闭")),

            ],

          ),
        )
    );
  }
}






