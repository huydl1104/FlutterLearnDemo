import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyGridViewExample(),
    );
  }
}

class MyGridViewExample extends StatelessWidget {
  const MyGridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Example'),
      ),
      body: const Example1()
    );
  }
}

class Example3 extends StatelessWidget {
  const Example3({super.key});

  Widget myWidget(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 300,
          //禁止滑动
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.amber,
              child: Center(child: Text('$index')),
            );
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return myWidget(context);
  }
}


class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[100],
                child: const Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[300],
                child: const Text('Sound of screams but the'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[400],
                child: const Text('Who scream'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[500],
                child: const Text('Revolution is coming...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[600],
                child: const Text('Revolution, they...'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class Example1 extends StatelessWidget {
  const Example1 ({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
      ],
    );
  }
}


