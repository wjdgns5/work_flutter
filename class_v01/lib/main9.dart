import 'package:flutter/material.dart';

void main() {
  runApp(MyApp9());
}

class MyApp9 extends StatelessWidget {
  const MyApp9({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Align Widget Example',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: Center(child: Text('First Item')),
                  ),
                ),
            
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text('second Item')),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}


