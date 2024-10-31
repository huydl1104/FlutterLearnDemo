import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SwiperExample(),
    );
  }
}

class SwiperExample extends StatefulWidget {
  @override
  _SwiperExampleState createState() => _SwiperExampleState();
}

class _SwiperExampleState extends State<SwiperExample> {
  int _currentIndex = 0;
  final int _itemCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Swiper Indicator'),
      ),
      body: Stack(
        children: [
          Swiper(
            scale: 0.8,
            fade: 0.8,
            indicatorLayout: PageIndicatorLayout.SCALE,
            itemCount: _itemCount,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              );
            },
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_itemCount, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: _currentIndex == index ? 12.0 : 8.0,
                  height: _currentIndex == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
