import 'package:explore_provider/src/features/todos/domain/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoDBProvider {
  late Box box;

  TodoDBProvider() {
    _initHive();
  }

  _initHive() async {
    box = Hive.box<Todo>('todos');
  }

  List<Todo> getAllTodos() {
    return List<Todo>.from(box.values);
  }

  Future<void> addTodo(Todo todo) async {
    await box.put(todo.id, todo);
  }

  Future<void> deleteTodo(String id) async {
    await box.delete(id);
  }
}
