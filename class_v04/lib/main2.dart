import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('드래그 기능 만들어 보기'),
        ),
        body: DraggableBox(),
      ),
    );
  }
}

class DraggableBox extends StatefulWidget {
  const DraggableBox({super.key});

  @override
  State<DraggableBox> createState() => _DraggableBoxState();
}

class _DraggableBoxState extends State<DraggableBox> {

  double _xOffset = 2.0; // x 축 이동 값
  double _yOffset = 5.0; // y 축 이동 값


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 드래그가 업데이트 될 때 호출되는 콜백 함수
      onPanUpdate: (details) {

        setState(() {

          _xOffset += details.delta.dx; // x축 방향으로 이동한 값
          _yOffset += details.delta.dy; // y축 방향으로 이동한 값

        });

      },
      child: Stack(
        children: [
          Positioned(
            left: _xOffset,
            top: _yOffset,
            child: Container(
              width: 150,
              height: 150,
              decoration:  BoxDecoration(
                color: Colors.blue,
                border: Border.all(width: 1.0, color: Colors.redAccent),
                borderRadius: BorderRadius.circular(8.0)
              ),
            ),
          )
        ],
      ),
    );
  }
}
