import 'package:explore_provider/src/features/todos/data/repositories/todo_repository.dart';
import 'package:explore_provider/src/features/todos/domain/todo.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  late TodoRepository _todoRepository;

  List<Todo> _todos = <Todo>[];
  List<Todo> get todos => _todos;

  TodosProvider() {
    _todoRepository = TodoRepository();
    init();
  }

  init() {
    _todos = _todoRepository.getAllTodos();
    notifyListeners();
  }

  void addTodo(Todo todo) async {
    await _todoRepository.addTodo(todo);
    await init();
    notifyListeners();
  }

  void updateTodo(Todo todo, String id) async {
    await _todoRepository.updateTodo(todo);
    _todos = _todos.map((e) {
      if (e.id == id) {
        return todo;
      } else {
        return e;
      }
    }).toList();
    notifyListeners();
  }

  void removeTodo(String id) async {
    await _todoRepository.deleteTodo(id);
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
