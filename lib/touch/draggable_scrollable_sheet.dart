import 'package:flutter/material.dart';

/// 一个用于Scrollable的容器，它通过调整可滚动对象的大小来响应拖动手势，直到达到限制，然后滚动。
void main() => runApp(const DraggableScrollableSheetApp());

class DraggableScrollableSheetApp extends StatelessWidget {
  const DraggableScrollableSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScrollableSheetPage(),
    );
  }
}

class ScrollableSheetPage extends StatefulWidget {
  const ScrollableSheetPage({super.key});

  @override
  _ScrollableSheetPageState createState() => _ScrollableSheetPageState();
}

class _ScrollableSheetPageState extends State<ScrollableSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DraggableScrollableSheet')),
        body: Stack(children: [
          Container(width: double.infinity, height: double.infinity),
          _sheetWid03(true),
          // SizedBox.expand(child: _sizedBox())
        ]));
  }

  _sheetWid01() => DraggableScrollableSheet(
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0))),
              child: _listWid(scrollController)));

  _sheetWid02() => DraggableScrollableSheet(
      initialChildSize: 0.66,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0))),
              child: _listWid(null)));

  _sheetWid03(isExpand) => DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: isExpand,
      builder: (BuildContext context, ScrollController scrollController) =>
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0))),
              child: _listWid(scrollController)));

  _listWid(controller) => SingleChildScrollView(
      controller: controller,
      child: Column(children: [
        Container(
            height: 5.0,
            width: 25.0,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            margin: EdgeInsets.symmetric(vertical: 12.0)),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: GridView.builder(
                physics: ScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: 0.7),
                itemCount: 12,
                itemBuilder: (context, index) => GestureDetector(
                    child: Column(children: <Widget>[
                      PhysicalModel(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset('images/icon_hzw01.jpg')),
                      SizedBox(height: 4),
                      Text('海贼王')
                    ]),
                    onTap: () {}))),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (BuildContext context, index) =>
                ListTile(title: Text('Current Item = ${(index + 1)}')))
      ]));

  _sizedBox() => FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 0.5,
      alignment: Alignment.center,
      child: Container(
          color: Colors.deepOrange.withOpacity(0.4),
          child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, index) =>
                  ListTile(title: Text('Current Item = ${(index + 1)}')))));
}

/*
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: LayoutBuilder(
          builder: (BuildContext outContext, BoxConstraints constraints){
            debugPrint("$constraints");
            return Container(
              color: Colors.black45,
              child: DraggableScrollableSheet(
                expand: false,
                snap: true,
                maxChildSize:0.7,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.blue[100],
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text('Item $index'));
                      },
                    ),
                  );
                },
              ),
            );
          }
        ),
      ),
    );
  }
}*/
