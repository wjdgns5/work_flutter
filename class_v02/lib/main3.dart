import 'package:class_v02/main2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'MyApp3',
    theme: ThemeData(
      useMaterial3: true,
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
    ),
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('My App 3', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      ),
      // backgroundColor: Colors.blue,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            width: 50,
            height: 50,
          ),

          Container(
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: 50,
            height: 50,
          ),

          Container(
            color: Theme.of(context).colorScheme.tertiary,
            width: 50,
            height: 50,
          ),

          Container(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            width: 50,
            height: 50,
          ),

          Container(
            color: Theme.of(context).colorScheme.primary,
            width: 50,
            height: 50,
          )
        ],
      ),
    ),
    );
  }
}
