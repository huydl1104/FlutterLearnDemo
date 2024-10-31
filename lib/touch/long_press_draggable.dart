import 'package:flutter/material.dart';

/// 一个小部件，支持与其子控件进行平移和缩放交互。
/// LongPressDraggable 参数详解
//     child：子组件，未进行拖拽时显示
//     feedback：跟随拖拽的组件
//     data：用于对DragTarget传递data
//     axis：Axis 拖拽方向，可以设置只能横向或者纵向拖拽
//     childWhenDragging：拖拽时child子组件显示样式
//     feedbackOffset = Offset.zero：
//     dragAnchor = DragAnchor.child：拖拽的锚地位置
//     ignoringFeedbackSemantics = true：当子child和feedback为同一个Widget时，可以设为false配合GlobalKey确保是同一个Widget 减少绘制
//     affinity：此部件与其它手势的竞争方式 在非affinity方向上不响应拖动事件,一般用于在滚动组件
//     maxSimultaneousDrags：同时支持拖动多少个点
//     onDragStarted：拖动开始时调用
//     onDraggableCanceled：在没有被DragTarget接受的情况下松开draggable时调用
//     onDragEnd：拖动结束时调用
//     onDragCompleted：Draggable被删除并被DragTarget接受时调用
void main() {
  runApp(const InteractiveViewerExampleApp());
}

class InteractiveViewerExampleApp extends StatelessWidget {
  const InteractiveViewerExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LongPressDraggable'),
        ),
        body: Center(
          child: LongPressDraggable(
            //子组件，未进行拖拽时显示
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            //跟随拖拽的组件
            feedback: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
            childWhenDragging: Container(
              color: Colors.amber,
              width: 100,
              height: 100,
            ),
            feedbackOffset: Offset(0, 10),
            // dragAnchor: DragAnchor.child,
            onDragStarted: () {
              print("onDragStarted");
            },
            onDragEnd: (DraggableDetails details) {
              print("onDragEnd : $details");
            },
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              print('onDraggableCanceled velocity:$velocity,offset:$offset');
            },
            onDragCompleted: () {
              print('onDragCompleted');
            },
          ),
        ),
      )
    );
  }
}