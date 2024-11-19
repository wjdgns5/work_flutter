import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GestureDector 사용'),),
        body: GestureDetector(
          onTap: () {
            print('스크린 탭~');
          },
          onDoubleTap: () {
            print('스크린 더블 탭');
          },
          onLongPress: () {
            print('스크린을 오랫동안 누를 때 호출 콜백 함수');
          },
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              color:  Colors.amber,
              child: Text('Tap, double Tap or Long Press', style: TextStyle(color: Colors.orange),),
            ),
          ),
        ),
      ),
    );
  }
}


