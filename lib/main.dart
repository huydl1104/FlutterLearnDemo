import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_application/component/btn_select.dart';

import 'battery_monitor_list.dart';
import 'button/elevated_button.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]); // 全屏显示
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          useMaterial3: true
        ),
        home: const CustomElevatedWidget(

        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLeftSelect = true;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFB7DCFF), Color(0xFFE0F0FF), Colors.white],
          stops: [0.0, 0.1, 0.9],
        )),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, top: 50),
              child: Container(
                height: 40,
                child: Stack(
                  children: const [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image(
                          width: 24,
                          height: 24,
                          image: AssetImage("images/cm_main_back.png")),
                    ),
                    Center(
                      child: Text(
                        "耗时监控列表",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 44,
              margin: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color(0xFFC8E4FF)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                          color:
                              isLeftSelect ? Colors.white : Color(0xFFC8E4FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 165,
                        height: 38,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLeftSelect = !isLeftSelect;
                            });
                          },
                          child: const Center(
                            child: Text(
                              "近24小时耗电排行",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: const EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          color: isLeftSelect
                              ? const Color(0xFFC8E4FF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 38,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLeftSelect = !isLeftSelect;
                            });
                          },
                          child: const Center(
                            child: Text(
                              "近7日耗电排行",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text("title$index"),
                    subtitle: Text("subTitle$index"),
                    trailing: TextButton(
                        onPressed: ()=>{

                        },
                        child: Text("点击"),
                    ),
                  );
                }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
