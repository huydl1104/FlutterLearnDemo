import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomElevatedWidget extends StatefulWidget {
  const CustomElevatedWidget({Key? key}) : super(key: key);

  @override
  State<CustomElevatedWidget> createState() => _CustomElevatedWidgetState();
}

class _CustomElevatedWidgetState extends State<CustomElevatedWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      height:100,
      child: Placeholder(),
    );
  }
}
