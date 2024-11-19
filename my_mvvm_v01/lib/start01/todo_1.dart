import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // Todo 기능을 개발하기 위해 필요한 데이터는 뭘까?
  // UI 로직 :  프로젠테이션 로직
  final TextEditingController _controller = TextEditingController();

  // 데이터 : 할 일을 (목록을) 저장하는 리스트 (저장 공간)
  List<String> todos = [];

  // 비즈니스 로직 : 할 일을 추가하는 기능
  void addTodo() {
    // 자료구조에 접근해서 사용자가 넣은 데이터를 추가하는 기능

    // 방어적 코드 작성
    if(_controller.text.isNotEmpty) {

      // 화면을 동작시키는 프로젠테이션 로직
      setState(() {
        // 텍스트가 비어었지 않는다면
        todos.add(_controller.text);
        print("todos 확인 :  ${todos.toString()}");
      });
      _controller.clear(); // 프로젠테이션 로직 화면 로직
    }
  }

  // 비즈니스 로직 : 할 일을 삭제하는 기능
  void removeTodo(int index) {
    // 자료구조에 접근해서 해당 항목을 삭제 하는 기능
    // 삭제 처리
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Todo List'),
      ),
      body: Column(
        children: [
          // 입력필드 만들기
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: '작업을 입력 하시오'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // 비즈니스 로직 실행
                    addTodo();
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
          
          // 아래에 할일 목록 표시 구성 
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index]),
                trailing: IconButton(icon: Icon(Icons.delete),
                onPressed: () {
                  // 비지니스 로직 호출
                  removeTodo(index);
                },
                ),
              );
            },),
          ),
          
        ],
      ),
    );
  }
}
