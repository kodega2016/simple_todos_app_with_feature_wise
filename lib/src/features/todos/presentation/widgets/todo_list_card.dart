import 'package:explore_provider/src/features/todos/domain/todo.dart';
import 'package:flutter/material.dart';

class TodoListCard extends StatelessWidget {
  const TodoListCard({
    Key? key,
    required Todo todo,
    required this.onTap,
  })  : _todo = todo,
        super(key: key);

  final Todo _todo;
  final Function(Todo) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_todo.title),
        subtitle: Text(_todo.description),
        onTap: () {
          onTap(_todo);
        },
      ),
    );
  }
}
