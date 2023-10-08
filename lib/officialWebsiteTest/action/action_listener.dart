import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "Flutter demo action listener";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const Center(child: MyStateFulWidget()),
      ),
    );
  }
}

class MyStateFulWidget extends StatefulWidget {
  const MyStateFulWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyState();
  }
}

class _MyState extends State<MyStateFulWidget> {
  late final MyAction _myAction;
  late final ActionDispatcher _dispatcher;
  bool _on = false;

  @override
  void initState() {
    super.initState();
    _myAction = MyAction();
    _dispatcher = const ActionDispatcher();
  }

  void _toggleState() {
    setState(() {
      _on = !_on;
    });
  }

  void _callBack(Action<Intent> action) {
    //收到事件回调
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("action listener called"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
            onPressed: _toggleState, child: Text(_on ? "Disable" : "Enable")),
      ),
      if (_on)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ActionListener(
            listener: _callBack,
            action: _myAction,
            child: ElevatedButton(
              child: const Text("call action Listener"),
              onPressed: () {
                _dispatcher.invokeAction(_myAction, const MyIntent());
              },
            ),
          ),
        ),
      if (!_on)
        Container(
          child: const Text("test---"),
        )
    ]);
  }
}

class MyIntent extends Intent {
  const MyIntent();
}

class MyAction extends Action<MyIntent> {
  @override
  void addActionListener(ActionListenerCallback listener) {
    super.addActionListener(listener);
    debugPrint("MyAction addActionListener ->$listener ");
  }

  @override
  void removeActionListener(ActionListenerCallback listener) {
    super.removeActionListener(listener);
    debugPrint("MyAction removeActionListener ->$listener ");
  }

  @override
  Object? invoke(MyIntent intent) {
    notifyActionListeners();
  }
}
