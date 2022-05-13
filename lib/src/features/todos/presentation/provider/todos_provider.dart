import 'package:explore_provider/src/features/todos/domain/todo.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = <Todo>[];
  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo, String id) {
    _todos = _todos.map((e) {
      if (e.id == id) {
        return todo;
      } else {
        return e;
      }
    }).toList();
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
