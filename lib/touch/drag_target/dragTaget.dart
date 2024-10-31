
import 'package:flutter/material.dart';

///用于实现拖放操作的目标区域。它通常与 Draggable 小部件一起使用，以创建拖放功能。
void main() {
  runApp(const MyDragTargetApp());
}

class MyDragTargetApp extends StatelessWidget {
  const MyDragTargetApp({super.key});

  static const String _title = 'Widget Observer Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: WidgetDragTarget(),
        ),
      ),
    );
  }
}

class WidgetDragTarget extends StatefulWidget {
  const WidgetDragTarget({Key? key}) : super(key: key);

  @override
  State<WidgetDragTarget> createState() => _WidgetDragTargetState();
}

class _WidgetDragTargetState extends State<WidgetDragTarget> {

  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Draggable<int>(
          // Data is the value this Draggable stores.
            data: 10,
            onDragStarted: (){
              debugPrint("onDragStarted --");
            },
            onDragEnd: (DraggableDetails details){
              debugPrint("onDragEnd -->$details");
            },
            onDragCompleted: (){
              debugPrint("onDragCompleted -----");
            },
            onDraggableCanceled: (Velocity velocity, Offset offset){
              debugPrint("onDraggableCanceled velocity -->$velocity offset->$offset");
            },
            onDragUpdate: (DragUpdateDetails details){
              debugPrint("onDragUpdate onDragUpdate -->$details");
            },
            feedback: Container(
              color: Colors.deepOrange,
              height: 100,
              width: 100,
              child: const Icon(Icons.directions_run),
            ),
            childWhenDragging: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.pinkAccent,
              child: const Center(
                child: Text('Child When Dragging'),
              ),
            ),
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.lightGreenAccent,
              child: const Center(
                child: Text('Draggable'),
              ),
            ),

        ),
        DragTarget<int>(
          builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
              ) {
            return Container(
              height: 100.0,
              width: 100.0,
              color: Colors.cyan,
              child: Center(
                child: Text(
                    'Value is updated to: $acceptedData ,rejected->$rejected'),
              ),
            );
          },
          onAccept: (int data) {
            debugPrint("onAccept data ->$data ");
            setState(() {
              acceptedData += data;
            });
          },
        ),
      ],
    );
  }
}

