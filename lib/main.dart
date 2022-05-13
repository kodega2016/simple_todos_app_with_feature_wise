import 'package:explore_provider/src/features/todos/domain/todo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  // await Hive.deleteBoxFromDisk('todos');
  await Hive.openBox<Todo>('todos');
  runApp(const MyTodoApp());
}
