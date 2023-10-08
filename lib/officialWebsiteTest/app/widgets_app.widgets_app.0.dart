import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  
  Future<bool> _willPop() async {
    DateTime currentTime = DateTime.now();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'Example',
      color: const Color(0xFF000000),
      home: WillPopScope(child: const Center(child: Text('Hello World')), onWillPop: _willPop),
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) =>
          PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            builder(context),
      ),
    );
  }
}
