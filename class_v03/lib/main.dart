import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // build 메서드가 Painting 한다.
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('그리드뷰 위젯 연습'),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blueGrey,
                child: Center(child: Text('index number :  + $index')),
              );
            },
        ),
      ),
    );
  }
}
