import 'package:flutter/material.dart';

///用于创建一个动画遮罩层，通常用于在执行模态操作（例如弹出对话框）时，将其周围的 UI 内容变暗。这个小部件可以用于创建平滑的遮罩动画。import 'dart:async';

void main() => runApp(const AnimatedModalBarrierDemo());


class AnimatedModalBarrierDemo extends StatefulWidget {
  const AnimatedModalBarrierDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimatedModalBarrierDemoState();
  }
}

class _AnimatedModalBarrierDemoState extends State<AnimatedModalBarrierDemo>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  late Widget _modalBarrier;

  late AnimationController _controller;

  late Animation<Color?> _colorTweenAnimation;

  @override
  void initState() {
    ColorTween _colorTween = ColorTween(
      begin: Color.fromARGB(100, 255, 255, 255),
      end: Color.fromARGB(100, 127, 127, 127),
    );

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _colorTweenAnimation = _colorTween.animate(_controller);

    _modalBarrier = AnimatedModalBarrier(
      color: _colorTweenAnimation,
      dismissible: true,
    );

    super.initState();
  }

  List<Widget> buildWidgetList(BuildContext context) {
    List<Widget> widgets = <Widget>[
      ElevatedButton(
        child: Text('Button'),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });

          _controller.reset();

          _controller.forward();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('A SnackBar has been shown.'),
            ),
          );

          Future.delayed(const Duration(seconds: 5), () {
            setState(() {
              _isLoading = false;
            });
          });
        },
      ),
    ];
    debugPrint("buildWidgetList  _isLoading -->$_isLoading");
    if (_isLoading) {
      widgets.add(_modalBarrier);
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedModalBarrierDemo'),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 250.0,
                    // alignment: FractionalOffset.center,
                    child: new Stack(
                      alignment: AlignmentDirectional.center,
                      children: buildWidgetList(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
