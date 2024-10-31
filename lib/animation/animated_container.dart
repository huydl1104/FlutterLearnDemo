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
      appBar: AppBar(title: Text("AnimatedContainer"),),
      body: Center(
        child: AnimatedContainer(
          width: isChange ? 300.0 : 200.0,
          height: isChange ? 200.0 : 300.0,
          alignment: isChange ? Alignment.bottomCenter : Alignment.topCenter,
          decoration: BoxDecoration(
            color: isChange ? Colors.red : Colors.blue,
            border: Border.all(width: isChange?4:1),
            borderRadius: BorderRadius.all(
              Radius.circular(isChange?4:1),
            )
          ),
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 2),
          child: Stack(
            children: [
              FlutterLogo(size: 45),
              Text("AnimatedContainer"),
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




