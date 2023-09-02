import 'package:flutter/material.dart';

void main() {
  runApp(const MyObserverApp());
}

class MyObserverApp extends StatelessWidget {
  const MyObserverApp({super.key});

  static const String _title = 'Widget Observer Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: WidgetObserver0(),
        ),
      ),
    );
  }
}

class WidgetObserver0 extends StatefulWidget {
  const WidgetObserver0({Key? key}) : super(key: key);

  @override
  State<WidgetObserver0> createState() => _WidgetObserver0State();
}

class _WidgetObserver0State extends State<WidgetObserver0> with WidgetsBindingObserver{
  final List<AppLifecycleState> _stateLifecycle = <AppLifecycleState>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _stateLifecycle.add(state);
    });

  }


  @override
  Widget build(BuildContext context) {
    if (_stateLifecycle.isNotEmpty) {
      return ListView.builder(
          key: const ValueKey<String>("stateHistoryList"),
          itemCount: _stateLifecycle.length,
          itemBuilder: (BuildContext context, int index) {
            return Text('state is: ${_stateLifecycle[index]}');
          });
    }

    return const Center(
      child: Text("empty !"),
    );
  }
}
