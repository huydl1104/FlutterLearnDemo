import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('测量小部件的高度示例'),
        ),
        body: MeasureHeight(
          onHeightMeasured: (height){
            debugPrint('measureHeight ->$height');
          },

          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(width: double.infinity,height: 100,color: Colors.black,),
                Container(width: double.infinity,height: 100,color: Colors.blue,),
                Container(width: double.infinity,height: 100,color: Colors.red,),
                Container(width: double.infinity,height: 100,color: Colors.green,),
                Container(width: double.infinity,height: 100,color: Colors.yellow,),

              ],
            ),),
        ),
      ),
    );
  }
}

class MeasureHeight extends StatefulWidget {
  final Widget child;
  final void Function(double height) onHeightMeasured;

  const MeasureHeight({required this.child, required this.onHeightMeasured});

  @override
  _MeasureHeightState createState() => _MeasureHeightState();
}

class _MeasureHeightState extends State<MeasureHeight> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final double height = renderBox.size.height;
        widget.onHeightMeasured(height);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
