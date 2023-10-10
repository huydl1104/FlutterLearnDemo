import 'package:flutter/material.dart';
import 'package:flutter_demo_application/CardDemo.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedImplicitWidget(),
  ));
}



class AnimatedImplicitWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedState();
  }
}

class _AnimatedState extends State<AnimatedImplicitWidget> {

  bool isChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedPadding"),),
      body: Center(
        child: AnimatedPadding(
          duration: Duration(seconds: 2),
          padding: EdgeInsets.all(isChange ? 20: 1),
          curve: Curves.fastOutSlowIn,
          child: Stack(
            children: <Widget>[
              FlutterLogo(size: 45),
              Text("AnimatedPadding"),
            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            isChange = !isChange;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

}




