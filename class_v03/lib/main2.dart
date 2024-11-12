import 'package:flutter/material.dart';

void main() {
  runApp(BottomSheetApp());
}

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myApp1',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
        ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample'),),
        body: MyBottomSheet(),
      ),
    );
  }
}

// 새로운 클래스
class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('show bottom sheet'),
        onPressed: () {
          // 이벤트 핸들러 처리
         // showBottomSheet(context: context, builder: builder)
          showModalBottomSheet(context: context, builder: (context) {


            return Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add Item'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.remove),
                    title: Text('Remove Item'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
          });
        },
      ),
    );
  }
}

