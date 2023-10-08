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
  final ActionModel _actionModel = ActionModel();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        ModifyIntent: ModifyDataAction(_actionModel, type: 1),
        SaveIntent: SaveDataAction(_actionModel)
      },
      child: Builder(builder: (BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Actions.invoke(context, ModifyIntent(++count));
                    },
                    icon: const Icon(Icons.exposure_plus_1)),
                AnimatedBuilder(
                    animation: _actionModel.data,
                    builder: (BuildContext context, Widget? child) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('${_actionModel.data.value}',
                            style: Theme.of(context).textTheme.headlineMedium),
                      );
                    }),
                Visibility(
                  visible: true,
                  child: IconButton(
                      onPressed: () {
                        Actions.invoke(context, ModifyIntent(--count));
                      },
                      icon: const Icon(Icons.exposure_minus_1)),
                ),
              ],
            ),
            Spacer(),
          ],
        );
      }),
    );
  }
}

class ModifyIntent extends Intent {
  ModifyIntent(this.value);

  final int value;
}

class SaveIntent extends Intent {
  SaveIntent();
}

class ModifyDataAction extends Action<ModifyIntent> {
  ModifyDataAction(this._model, {required this.type});

  final ActionModel _model;
  int type;

  @override
  Object? invoke(ModifyIntent intent) {
    if (type == 1) {
      _model.setDataValue(intent.value);
    } else {
      _model.dataSave();
    }
    return null;
  }
}

class SaveDataAction extends Action<ModifyIntent> {
  SaveDataAction(this._model);

  final ActionModel _model;

  @override
  Object? invoke(ModifyIntent intent) {
    _model.dataSave();
    return null;
  }
}

class ActionModel {
  ValueNotifier<bool> isDirty = ValueNotifier(false);
  ValueNotifier<int> data = ValueNotifier(0);

  int dataSave() {
    if (isDirty.value) {
      isDirty.value = false;
    }
    return data.value;
  }

  void setDataValue(int value) {
    isDirty.value = data.value != value;
    data.value = value;
  }
}
