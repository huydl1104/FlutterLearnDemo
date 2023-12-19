

import 'package:flutter/material.dart';

void main() => runApp(const ChangeNotifierExampleApp());

class ChangeNotifierExampleApp extends StatelessWidget {
  const ChangeNotifierExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ChangeNotifierDemo Sample')),
        body: const ChangeNotifierDemo(),
      ),
    );
  }
}

class MyChangeNotifier extends ChangeNotifier{
  int count = 0;
  changeCount(int count1){
    count = count1;
    notifyListeners();
  }
  clear(){
    count = 0;
    notifyListeners();
  }

}


class ChangeNotifierDemo extends StatefulWidget {
  const ChangeNotifierDemo({super.key});

  @override
  State<ChangeNotifierDemo> createState() => _ChangeNotifierDemoState();
}

class _ChangeNotifierDemoState extends State<ChangeNotifierDemo> {
  late MyChangeNotifier myChangeNotifier;

  @override
  void initState() {
    super.initState();
    myChangeNotifier = MyChangeNotifier();
    myChangeNotifier.addListener(() {

      debugPrint("myChangeNotifier  state change ");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: ()=>{
          myChangeNotifier.changeCount(10)
        }, child: Text('change'),),

        Text("${myChangeNotifier.count}"),
        Container(
          decoration: BoxDecoration(color: Colors.blue),
          width: double.infinity,
          height: 300,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              width: 100,
              height: 100,
            ),
          ),
        ),

      ],
    );
  }
}
