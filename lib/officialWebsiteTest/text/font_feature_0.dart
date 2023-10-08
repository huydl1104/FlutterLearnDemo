import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const ExampleDemo1());
}

class ExampleDemo1 extends StatelessWidget {
  const ExampleDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExampleDemo1Widget(),
    );
  }
}

final TextStyle titleStyle = TextStyle(
  fontSize: 18,
  fontFeatures: const <FontFeature>[FontFeature.enable('smcp')],
  color: Colors.blueGrey[600],
);

class ExampleDemo1Widget extends StatelessWidget {
  const ExampleDemo1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          const Spacer(),
          Text('regular numbers have their place:'),
          const Text('The 1972 cup final was a 1-1 draw.',
              style: TextStyle(
                fontFamily: 'Cardo',
                fontSize: 24,
              )),
          const Spacer(),
          Text('but old-style figures blend well with lower case:',
              style: titleStyle),
          const Text('The 1972 cup final was a 1-1 draw.',
              style: TextStyle(
                  fontFamily: 'Cardo',
                  fontSize: 24,
                  fontFeatures: <FontFeature>[FontFeature.oldstyleFigures()])),
          const Spacer(),
          const Divider(),
          const Spacer(),
          Text('fractions look better with a custom ligature:',
              style: titleStyle),
          const Text('Add 1/2 tsp of flour and stir.',
              style: TextStyle(
                  fontFamily: 'Milonga',
                  fontSize: 24,
                  fontFeatures: <FontFeature>[
                    FontFeature.alternativeFractions()
                  ])),

          const Text(
            'Fractions: 1/2 2/3 3/4 4/5',
            style: TextStyle(
              fontFamily: 'Ubuntu Mono',
              fontFeatures: <FontFeature>[
                // FontFeature.alternative(1)
                FontFeature.numerators(),
                // FontFeature.alternativeFractions(),
              ],
            ),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
