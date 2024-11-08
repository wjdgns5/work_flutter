import 'package:class_v02/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp6());
}

// stf
class MyApp6 extends StatefulWidget {
  const MyApp6 ({super.key});

  @override
  State<MyApp6> createState() => _State();
}

// private 을 의미한다. ---> dart public, private 만 사용
class _State extends State<MyApp6> {
// 멤버 변수

// public
int count0 = 0;

// private
int _count = 0;

int get count => _count; // private 변수

  @override
  void initState() {
    // TODO: implement initState
    // 객체가 메모리에 올라 올 때 단 한번만 수행 시키는 메서드
    print('initState() 메서드 호출');
    super.initState();
  }

// 멤버 메서드
  @override
  Widget build(BuildContext context) {

    // 지역변수
    print('build() 메서드 호출');

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: () {

            setState(() {

              _count ++;
              print("_count :  $count");

            });
          },
            child: Text('$_count'),
          ),
        ),
      ),
    );
  }
}
