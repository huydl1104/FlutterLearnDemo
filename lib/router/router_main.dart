// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/details' is mapped to [DetailsScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.
void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: 'details',
      path: '/details',
      builder: (BuildContext context, GoRouterState state) {
        final data = state.queryParameters['test'];
        debugPrint("传递数据 data->$data");
        return DetailsScreen(data);
      },
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.goNamed('details',queryParameters: {'test':"123"}),
              child: const Text('Go to the Details screen'),
            ),

            ElevatedButton(
              onPressed: () async {
                final state = await context.pushNamed<String>('details',queryParameters: {'test':"4444"});
                debugPrint('返回值 state ->$state');
              },
              child: const Text('Go to the Details screen params '),
            ),
          ],
        ),
      ),
    );
  }
}


class DetailsScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen]
  String? parameter;
  DetailsScreen(this.parameter, {super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    super.initState();
    debugPrint("DetailsScreen parameter->${widget.parameter}");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Go back to the Home screen'),
            ),

            ElevatedButton(
              onPressed: () => context.pop("22222222"),
              child: const Text('Go back to the Home screen params'),
            ),
          ],
        ),
      ),
    );
  }
}