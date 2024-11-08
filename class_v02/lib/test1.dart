import 'package:flutter/material.dart';

void main() {
  runApp(test1());
}

class test1 extends StatelessWidget {
  const test1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: SingleChildScrollView(

          // 스크롤 가능한 단일 자식 위젯을 만들 때
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: Column(
                // 세로로 가능하다.
                mainAxisAlignment: MainAxisAlignment.center, // 주축은 지금 : 세로방향
                children: [
                  
                  // 플러터 이미지 아이콘
                  Image.asset(
                    '/images/flutter.png',
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),

                  SizedBox(height: 50.0), // 아이콘과 텍스트 필드 사이 여백
                  
                  TextField(
                    decoration: InputDecoration(
                      labelText: '이메일',

                      
                    ),
                    // Image.asset('/images/message.png')
                  ),

                 Image.asset('/images/message.png')


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
