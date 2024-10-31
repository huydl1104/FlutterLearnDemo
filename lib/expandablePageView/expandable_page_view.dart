
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo_3/expandablePageView/page/basic_examples_page.dart';
import 'package:flutter_learn_demo_3/expandablePageView/page/vertical_balance_page.dart';
import 'package:flutter_learn_demo_3/expandablePageView/page/balance_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          BalancePage(),
          VerticalBalancePage(),
          BasicExamplesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        unselectedItemColor: const Color(0xff3a0ca3),
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money_rounded,
            ),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.currency_exchange_rounded,
            ),
            label: '百宝箱',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: '我的',
          ),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
