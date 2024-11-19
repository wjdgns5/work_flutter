import 'package:flutter/material.dart';
import 'package:my_mvvm_v01/start02/view_models/todo_view_model.dart';

void main() => runApp(MaterialApp(home: TodoScreen()));

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // MVVM 패턴이기 때문에 View 는 ViewModel 클래스만 참조 하면 된다.
  final TodoViewModel todoViewModel = TodoViewModel();
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Basic Todo List'),
      ),
      body: Column(
        children: [
          // 입력 필드 만들기
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
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        todoViewModel.addTodo(_controller.text);
                      });
                      _controller.clear();
                    }
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
          // 아래에 할일 목록 표시 구성
          Expanded(
            child: ListView.builder(
                itemCount: todoViewModel.todos.length,
                itemBuilder: (context, index) {
                  // 뷰모델에 있는 자료구조 안에 각 인덱스에 맵핑된 객체 Todo인스턴스 하나
                  final todo = todoViewModel.todos[index];

                  return ListTile(
                    title: Text(todo.title),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          todoViewModel.removeTodo(todo.id);
                        });
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
