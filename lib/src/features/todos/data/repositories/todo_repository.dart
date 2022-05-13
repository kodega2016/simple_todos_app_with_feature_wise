import 'package:explore_provider/src/features/todos/data/data_sources/todo_db_provider.dart';
import 'package:explore_provider/src/features/todos/domain/todo.dart';

class TodoRepository {
  final TodoDBProvider _todoDBProvider;

  TodoRepository({
    TodoDBProvider? todoDBProvider,
  }) : _todoDBProvider = todoDBProvider ?? TodoDBProvider();

  List<Todo> getAllTodos() {
    final _todos = _todoDBProvider.getAllTodos();

    return _todos;
  }

  Future<void> addTodo(Todo todo) async {
    await _todoDBProvider.addTodo(todo);
  }

  Future<void> deleteTodo(String id) async {
    await _todoDBProvider.deleteTodo(id);
  }

  Future<void> updateTodo(Todo todo) async {
    await _todoDBProvider.addTodo(todo);
  }
}
