import 'package:explore_provider/src/features/todos/domain/todo.dart';
import 'package:flutter/material.dart';

class TodoListCard extends StatelessWidget {
  const TodoListCard({
    Key? key,
    required Todo todo,
    required this.onTap,
    required this.onDelete,
  })  : _todo = todo,
        super(key: key);

  final Todo _todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: ValueKey(_todo.id),
        direction: DismissDirection.endToStart,
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          onDelete(_todo);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              _todo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              _todo.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              onTap(_todo);
            },
          ),
        ),
      ),
    );
  }
}
