import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget : 정적
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 전체를 수직으로 설정한다.
    return Column(

      // 자료구조 - 리스트를 나타낸다.
      children: [
        // 가로로 설정한다.
        Row(
          // 왼쪽에서 오른쪽으로 이동
          textDirection: TextDirection.ltr,
          // 주축의 시작점에서 자식 위젯들을 배치
          mainAxisAlignment: MainAxisAlignment.start,
          // 자료구조 - 리스트를 나타낸다.
          children: [
            Container(color: Colors.red, width: 50, height: 50),
            Container(color: Colors.blue, width: 50, height: 50),
            Container(color: Colors.yellow, width: 50, height: 50)
          ],
        ),

        Row(
          // 왼쪽에서 오른쪽으로 이동
          textDirection: TextDirection.ltr,
          // 주축의 끝점에서 자식 위젯들을 배치
          mainAxisAlignment: MainAxisAlignment.end,
          // 자료구조 - 리스트를 나타낸다.
          children: [
            Container(color: Colors.red, width: 50, height: 50),
            Container(color: Colors.blue, width: 50, height: 50),
            Container(color: Colors.yellow, width: 50, height: 50)
          ],
        ),

        Row(
          // 왼쪽에서 오른쪽으로 이동
          textDirection: TextDirection.ltr,
          // 주축의 중앙에 자식 위젯들을 배치
          mainAxisAlignment: MainAxisAlignment.center,
          // 자료구조 - 리스트를 나타낸다.
          children: [
            Container(color: Colors.red, width: 50, height: 50),
            Container(color: Colors.blue, width: 50, height: 50),
            Container(color: Colors.yellow, width: 50, height: 50),
            ]
        )


      ],
    );
  }

}



