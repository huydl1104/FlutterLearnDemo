import 'package:flutter/material.dart';

void main() {
  runApp(MyStateApp());
}

class MyStateApp extends StatefulWidget {
  MyStateApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateAppAsync();
  }
}

class StateAppAsync extends State<MyStateApp> {
  
  final Future<String> _asyncAction =  Future<String>.delayed(
      const Duration(seconds: 5), () => "load success");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Async builder Demo"),
        ),
        body: Center(
          child: FutureBuilder<String>(
              future: _asyncAction,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Result: ${snapshot.data}'),
                    ),
                  ];
                }else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                );
                
              }),
        ),
      ),
    );
  }
}
