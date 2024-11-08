import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // TextEditingController로 TextField의 controller에 넣을 객체를 선언
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(),
               const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    labelStyle: TextStyle(color: Colors.amber),
                    hintStyle: TextStyle(color: Colors.brown),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.blue),
                    ),
                    icon: Icon(Icons.settings),
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(Icons.star),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.search,
                  obscureText: true,
                  // TextEditingController 객체를 controller에 설정
                  controller: _emailController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TextEditingController 객체의 text 속성으로 TextField의 입력된
                    // 문자열을 가져올 수 있음
                    print(_emailController.text);
                  },
                  child: Text('Click'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
