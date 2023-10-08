// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Flutter code sample for [PhysicalShape].

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PhysicalShape Sample'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder:(BuildContext context, BoxConstraints constraints){
            debugPrint("constraints->$constraints");
            return Column(
              children: <Widget> [
                const SizedBox(
                  height: 100.0,
                ),
                PhysicalShape(
                  elevation: 5.0,
                  clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  color: Colors.orange,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget> [
                      SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: Center(
                          child: Text(
                            'Hello, World!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(40.0),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 100,
                    ),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.blue,Colors.red])
                    ),
                    child: const Text('ClipRRect', style: style),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
