import 'package:flutter/material.dart';

void main() {
  runApp(MyApp11());
}

class MyApp11 extends StatelessWidget {
  const MyApp11({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ListView 안에 스크롤 뷰가 들어가 있다.
        body: ListView.builder(
          physics: ClampingScrollPhysics(), // 물리적인 스크롤 방식
          itemCount: 20, // 이게 1 ~ 19까지 나온다. 이거 없으면 무한 스크롤
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(index.toString()),
              ),
              title: Text('Item $index'),
              subtitle: Text('sub Item $index'),
            );
          },
        ),
      ),
    );
  }
}
