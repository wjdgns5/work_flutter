import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  // build 메서드가 Painting 한다.
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('페이지 뷰 위젯 연습'),
        ),
        body: PageView(
          controller: PageController(
            initialPage: 2,
            viewportFraction: 0.9
          ),
          children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.redAccent,
            ),

            Container(
              margin: EdgeInsets.all(10),
              color: Colors.blueGrey,
            ),

            Container(
              margin: EdgeInsets.all(10),
              color: Colors.green,
            )

          ],
        ),
      ),
    );
  }
}
