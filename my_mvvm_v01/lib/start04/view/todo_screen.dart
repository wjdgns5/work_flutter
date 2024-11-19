import 'package:flutter/material.dart';
import 'package:my_mvvm_v01/start04/view_models/todo_view_model.dart';
import 'package:provider/provider.dart';

// MaterialApp 앱 안에서 외부 라이브러리(프로바이더) 위젯을 감싸 주어야 한다.
void main() => runApp(
      MaterialApp(
        // (_) => TodoViewModel() -> 매개변수를 사용하지 않을거면 _ 를 선언한다.
        home: ChangeNotifierProvider(
          create: (_) => TodoViewModel(),
          builder: (context, child) {
            return TodoScreen();
          },
        ),
      ),
    );

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM provider Todo List'),
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
                    // 여기에서 뷰 모델 클래스를 가져오자 --> DI 처리
                    final todoViewModel = Provider.of<TodoViewModel>(context, listen: false);
                    if(_controller.text.isNotEmpty) {
                       todoViewModel.addTodo(_controller.text);
                       _controller.clear();
                      }
                    },
                  icon: Icon(Icons.add),
                )
              ],
            ),
          ),
          // 아래에 할일 목록 표시 구성
          // 아래에 할일 목록 표시 구성
          Expanded(
            child: Consumer<TodoViewModel>(
              builder: (context, todoViewModel, child) {
                return ListView.builder(
                  itemCount: todoViewModel.todos.length,
                  itemBuilder: (context, index) {
                    // 뷰모델에 있는 자료구조 안에 각 인덱스에 맵핑된 객체 Todo인스턴스 하나
                    final todo = todoViewModel.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => todoViewModel.removeTodo(todo.id),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
