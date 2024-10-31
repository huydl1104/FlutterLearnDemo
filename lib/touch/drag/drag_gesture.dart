import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('上下拖动 Widget 示例')),
        body: DraggableWidget(),
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double topPosition = 100.0;
  double leftPosition = 100.0;

  double _getTopDis(BuildContext context) {
    double paddingTop = MediaQuery.of(context).padding.top;
    double defaultAppBarHeight = AppBar().preferredSize.height;
    return paddingTop + defaultAppBarHeight;
  }

  @override
  Widget build(BuildContext context) {
    double widthBox = 200;
    double heightBox = 500;
    return Stack(
      children: [
        Positioned(
          top: topPosition,
          left: leftPosition,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                topPosition += details.delta.dy;
                if(topPosition < 0){
                  topPosition = 0;
                }
                if(topPosition > heightBox){
                  topPosition = heightBox;
                }

                leftPosition += details.delta.dx;
                if(leftPosition < 0){
                  leftPosition = 0;
                }
                if(leftPosition > widthBox){
                  leftPosition = widthBox;
                }
                print("topPosition ->$topPosition heightBox->$heightBox ---- leftPosition ->$leftPosition widthBox->$widthBox");
              });
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  '拖动我',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
