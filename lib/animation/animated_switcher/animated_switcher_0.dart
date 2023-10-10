import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("123123123"),
        ),
        body: const MyStateFull(),
      ),
    );
  }
}

class MyStateFull extends StatefulWidget {
  const MyStateFull({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStateFull();
  }
}

class _MyStateFull extends State<MyStateFull> {
  int _count = 0;

  Widget _buildWidget(BuildContext context, BoxConstraints builder) {
    debugPrint(
        "_buildWidget width->${builder.widthConstraints()} height->${builder.heightConstraints()}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation,child: child,);
          },
          child: Container(child: Text("$_count",style: TextStyle(fontSize: 20),),),
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            _count += 1;
          });
        }, child: Text("add"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      child: LayoutBuilder(builder: _buildWidget),
    );
  }
}
