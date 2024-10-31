import 'package:flutter/material.dart';

void main() => runApp(const HeroApp());

class HeroApp extends StatelessWidget {
  const HeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InheritedModelDemo(),
    );
  }
}

class InheritedModelDemo extends StatefulWidget {
  @override
  _InheritedModelDemoState createState() => _InheritedModelDemoState();
}

class _InheritedModelDemoState extends State<InheritedModelDemo> {
  int _nameIndex = 0;
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedModel'),
      ),
      body: MyInheritedModel(
        name: ' $_nameIndex',
        age: _age,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NameWidget(),
              AgeWidget(),
              TextButton(
                child: Text('修改name'),
                onPressed: () {
                  setState(() {
                    _nameIndex++;
                  });
                },
              ),
              TextButton(
                child: Text('修改age'),
                onPressed: () {
                  setState(() {
                    _age++;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyInheritedModel extends InheritedModel<String> {
  static String aspectName = 'aspect_name';
  static String aspectAge = 'aspect_age';

  final String name;
  final int age;

  const MyInheritedModel({required this.name, required this.age, required Widget child}) : super(child: child);

  static MyInheritedModel? of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<MyInheritedModel>(context,
        aspect: aspect);
  }

  @override
  bool updateShouldNotify(covariant MyInheritedModel oldWidget) {
    return name != oldWidget.name || age != oldWidget.age;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant MyInheritedModel oldWidget, Set<String> dependencies) {
    return (name != oldWidget.name && dependencies.contains(aspectName)) ||
        (age != oldWidget.age && dependencies.contains(aspectAge));
  }
}

class NameWidget extends StatefulWidget {
  @override
  _NameWidgetState createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('NameWidget didChangeDependencies ');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        'name:${MyInheritedModel.of(context, MyInheritedModel.aspectName)?.name}');
  }
}

class AgeWidget extends StatefulWidget {
  @override
  _AgeWidgetState createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('AgeWidget didChangeDependencies ');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        'age:${MyInheritedModel.of(context, MyInheritedModel.aspectAge)?.age}');
  }
}


