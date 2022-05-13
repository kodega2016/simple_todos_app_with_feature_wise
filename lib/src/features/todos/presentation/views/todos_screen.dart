import 'package:explore_provider/src/features/todos/presentation/providers/todos_provider.dart';
import 'package:explore_provider/src/features/todos/presentation/views/todos_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodosProvider>(
      create: (_) => TodosProvider(),
      child: const TodosView(),
    );
  }
}
