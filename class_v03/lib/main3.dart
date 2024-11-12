import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// StatefulWidget 클래스 - 상태를 관리 표현
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// 부모 클래스 상태를 접근 수정 등 역할 수정.
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin : 애니메이션 사용

  // 멤버 변수 선언
  // late --> 나중에 초기화 할꺼야
  // late --> 옵셔널 안 붙여도 된다.
  late TabController _tabController;

  //  initState 사용
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 메모리에 올라 갈때 단 한번 호출 되는 메서드
    _tabController = TabController(length: 3, vsync: this);
    // vsync: this --> SingleTickerProviderStateMixin
  }

  // dispose()
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 위젯이 제거 될 때 호출 된다.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main3',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
            Tab(text: 'HOME'),
            Tab(text: 'Favorites', icon: Icon(Icons.star),),
            Tab(text: 'Settings', icon: Icon(Icons.settings),),
          ],),
        ),
        body: TabBarView(
            controller: _tabController,
            children: [
          Center(child: Text('HOME'),),
          Center( child: Text('HOME'),),
          Center( child: Text('HOME'),),
        ],),
      ),
    );
  }
}
