import 'package:explore_provider/src/features/todos/data/repositories/todo_repository.dart';
import 'package:explore_provider/src/features/todos/domain/todo.dart';
import 'package:state_notifier/state_notifier.dart';

class TodosState {
  final List<Todo> todos;

  TodosState({
    required this.todos,
  });
}

class TodosStateNotifierProvider extends StateNotifier<TodosState> {
  late TodoRepository _todoRepository;

  TodosStateNotifierProvider() : super(TodosState(todos: [])) {
    _todoRepository = TodoRepository();
    getAllTodos();
  }

  getAllTodos() async {
    final _todos = _todoRepository.getAllTodos();
    state = TodosState(todos: _todos);
  }

  void addTodo(Todo todo) {
    _todoRepository.addTodo(todo);
    final _todos = [...state.todos, todo];
    state = TodosState(todos: _todos);
  }

  void removeTodo(String id) {
    _todoRepository.deleteTodo(id);
    final _todos = state.todos.where((element) => element.id != id).toList();
    state = TodosState(todos: _todos);
  }

  updateTodo(Todo todo, String id) {
    _todoRepository.updateTodo(todo);
    final _todos = state.todos.map((e) {
      if (e.id == id) {
        return todo;
      } else {
        return e;
      }
    }).toList();
    state = TodosState(todos: _todos);
  }
}
