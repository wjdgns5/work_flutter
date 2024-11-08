import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  runApp(MyHome2());
}

class MyHome2 extends StatelessWidget {
  const MyHome2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('tenCoding'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          elevation: 20.0,
        ),
      ),
    );
  }
}
