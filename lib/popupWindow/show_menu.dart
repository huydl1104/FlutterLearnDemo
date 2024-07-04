import 'package:flutter/material.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popup Menu Example'),
        ),
        body: Center(
          child: PopupMenuExample(),
        ),
      ),
    );
  }
}

class PopupMenuExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // 获取按钮的位置
            final RenderBox button = context.findRenderObject() as RenderBox;
            final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
            final RelativeRect position = RelativeRect.fromRect(
              Rect.fromPoints(
                button.localToGlobal(button.size.bottomLeft(Offset.zero), ancestor: overlay),
                button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
              ),
              Offset.zero & overlay.size,
            );

            // 显示菜单
            showMenu(
              context: context,
              position: position,
              items: [
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Item 1'),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text('Item 2'),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text('Item 3'),
                ),
              ],
            ).then((value) {
              if (value != null) {
                print('Selected: $value');
              }
            });
          },
          child: Container(color: Colors.amber, child: Text('Show Popup Menu')),
        ),
      ),
    );
  }
}
