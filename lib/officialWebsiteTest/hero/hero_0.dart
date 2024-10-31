
import 'package:flutter/material.dart';

void main() => runApp(const HeroApp());

class HeroApp extends StatelessWidget {
  const HeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HeroExample(),
    );
  }
}

class HeroExample extends StatelessWidget{
  const HeroExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 30,),
          ListTile(
            leading: Hero(tag: "hero-rectangle", child: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.blue,
            )),
            title: const Text("Tap on the icon to view hero animation transition"),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context){
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Second Page'),
                  ),
                  body:  Center(
                   child: Hero(tag: "hero-rectangle", child: Container(
                     width: 200.0,
                     height: 200.0,
                     color: Colors.blue,
                   )),
                  ),
                );
              }));
            },
          )
        ],
      ),
    );
  }

}