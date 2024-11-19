
// ViewModel 클래스 - 상태와 로직을 담당한다.

import 'package:flutter/material.dart';
import 'package:my_mvvm_v01/start02/models/todo.dart';



class TodoViewModel {

  // 데이터가 필요하다.
  List<Todo> todos = [];
  
  // 할 일을 추가하는 기능
  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    todos.add(newTodo);
  }
  
  // 할 일을 삭제하는 기능
  void removeTodo(String id) {
    // for문 돌려서 id가 같으면 삭제된다.
    todos.removeWhere( (todo) => todo.id == id);
  }


}