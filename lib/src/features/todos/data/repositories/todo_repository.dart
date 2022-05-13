import 'package:explore_provider/src/features/todos/data/data_sources/todo_db_provider.dart';

class TodoRepository {
  final TodoDBProvider _todoDBProvider;

  TodoRepository({
    TodoDBProvider? todoDBProvider,
  }) : _todoDBProvider = todoDBProvider ?? TodoDBProvider();
}
