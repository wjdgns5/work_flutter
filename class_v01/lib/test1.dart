import 'package:flutter/material.dart';

void main() {
  runApp(Test1());
}

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버깅 버그 : 비활성화
      home: Scaffold( // home : 속성을 주 페이지로 정의 , Scaffold : 시각적 레이웃 구성요소를 잡아 준다.
        appBar: AppBar( // AppBar :  상단 애플리케이션 바(앱바)를 생성하는 위젯
          // 왼쪽에 버튼 배치
          title: Row( // 제목을 가로로 배치
            mainAxisAlignment: MainAxisAlignment.start, // 주축 : 처음부터
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  '홈',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '소셜페이',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),

              Spacer(), // 위젯을 양쪽 끝에 배치할 때 유용

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.qr_code_2),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_outlined),
              ),
            ],
          ),
        ),



      ),
    );
  }
}
