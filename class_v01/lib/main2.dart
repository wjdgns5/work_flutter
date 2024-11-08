import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHome());
}

// 상태 여부 위젯 확인

// const : 컴파일 시점에 초기화 되는 코드를 const를 붙인다.
// final : 런타임 시점에 초기화 되는 코드를 사용

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        // 주축 방향 정렬
        mainAxisAlignment: MainAxisAlignment.center,
        // 교차축 방향 정렬
        crossAxisAlignment: CrossAxisAlignment.center,
        // 자료구조 - 리스트를 나타낸다.
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.red,
            margin: const EdgeInsets.only(bottom: 50) ,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

}