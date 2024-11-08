import 'package:flutter/material.dart';
import 'dart:math';

// 코드의 시작점
void main() {
  runApp(const MyApp());
}

// 상태기반으로 위젯을 분류 한다. (stless 입력 후 엔터)
// 정렬 : ctrl + alt + L
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,  // decoration 속성 사용시 color 속성 넣으면 오류 발생
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: 0),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: Border.all(
            width: 5,
            color: Colors.amber,
          )),
      child: Center(
        child: Text('안녕 나의 위젯~', textDirection: TextDirection.ltr),
      ),
    );
  }
}
