import 'package:flutter/material.dart';

// 코드의 시작점
void main() {
  runApp(MyApp());
}

// 상태 기반 UI

// stl + enter --> stateLess (정적)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 앞으로 MaterialApp 안에서 위젯을 선언해 보자.
    return MaterialApp(
      // 디버그모드 : 비활성화
      debugShowCheckedModeBanner: false,
      // 제목 : My Flutter
      title: 'My Flutter',
      // 테마
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.redAccent),
        primarySwatch: Colors.red
      ),
      // 시각적 레이아웃 구성요소를 잡아 주는 녀석이다.
      home: Scaffold(
        appBar: AppBar(title: Text('My Flutter'), backgroundColor: Colors.blue,),
      ),
    );
  }
}
