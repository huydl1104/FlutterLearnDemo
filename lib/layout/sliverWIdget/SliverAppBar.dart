import 'package:flutter/material.dart';



void main() {
  runApp(const StretchableSliverAppBar());
}

class StretchableSliverAppBar extends StatefulWidget {
  const StretchableSliverAppBar({super.key});

  @override
  State<StretchableSliverAppBar> createState() =>
      _StretchableSliverAppBarState();
}

class _StretchableSliverAppBarState extends State<StretchableSliverAppBar> {
  bool _stretch = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              // SliverAppBar(
              //   stretch: _stretch,
              //   onStretchTrigger: () async {
              //     // Triggers when stretching
              //   },
              //   // [stretchTriggerOffset] describes the amount of overscroll that must occur
              //   // to trigger [onStretchTrigger]
              //   //
              //   // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
              //   // [onStretchTrigger] when the user has overscrolled by 300.0 pixels.
              //   stretchTriggerOffset: 300.0,
              //   expandedHeight: 200.0,
              //   flexibleSpace: const FlexibleSpaceBar(
              //     title: Text('SliverAppBar'),
              //     background: FlutterLogo(),
              //   ),
              // ),
              SliverAppBar(
                  expandedHeight: 150.0,
                  flexibleSpace: const FlexibleSpaceBar(
                    title: Text('Available seats'),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add_circle),
                      tooltip: 'Add new entry',
                      onPressed: () { /* ... */ },
                    ),
                  ]
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      color: index.isOdd ? Colors.white : Colors.black12,
                      height: 100.0,
                      child: Center(
                        child: Text('$index', textScaleFactor: 5),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('stretch'),
                      Switch(
                        onChanged: (bool val) {
                          setState(() {
                            _stretch = val;
                          });
                        },
                        value: _stretch,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
