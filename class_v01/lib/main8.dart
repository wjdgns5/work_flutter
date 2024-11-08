import 'package:flutter/material.dart';

void main() {
  runApp(MyApp8());
}

class MyApp8 extends StatelessWidget {
  const MyApp8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Align Widget Example',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Container(
              // color: Colors.blue,
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(30.0),)
              ),
              child: Align(
                // alignment: Alignment.bottomCenter,
                alignment: Alignment(0.5, 0.5),
                child: Text('Hello, World!'),
              ),
            ),
          ),
        )
    );
  }
}

