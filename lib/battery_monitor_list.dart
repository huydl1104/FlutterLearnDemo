import 'package:flutter/material.dart';

class BatteryMonitor extends StatefulWidget {
  const BatteryMonitor({Key? key, required String title}) : super(key: key);

  @override
  State<BatteryMonitor> createState() => _BatteryMonitorState();
}

class _BatteryMonitorState extends State<BatteryMonitor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xB7DCFF), Color(0xE0F0FF), Color(0xF8FCFF)],
          )),
          child: Row(
            children: const [
              Image(image: AssetImage('images/cm_main_back.png')),
            ],
          ),
        ),

      ],
    );
  }
}
