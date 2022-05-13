import 'package:explore_provider/src/features/todos/presentation/providers/todos_state_notifier_provider.dart';
import 'package:explore_provider/src/features/todos/presentation/views/todos_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TodosStateNotifierProvider, TodosState>(
      create: (_) => TodosStateNotifierProvider(),
      child: const TodosView(),
    );
  }
}
