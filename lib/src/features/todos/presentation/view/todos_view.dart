import 'package:explore_provider/src/features/todos/presentation/provider/todos_provider.dart';
import 'package:explore_provider/src/features/todos/presentation/view/todos_form_screen.dart';
import 'package:explore_provider/src/features/todos/presentation/widgets/todo_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) {
                return ChangeNotifierProvider<TodosProvider>.value(
                  value: context.read<TodosProvider>(),
                  child: const TodosFormScreen(),
                );
              },
            ),
          );
        },
      ),
      body: Consumer<TodosProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: provider.todos.isEmpty
                ? const Center(
                    child: Text('No todos added yet.'),
                  )
                : ListView.builder(
                    itemCount: provider.todos.length,
                    itemBuilder: (context, i) {
                      final _todo = provider.todos[i];
                      return Dismissible(
                        key: ValueKey(_todo.id),
                        direction: DismissDirection.endToStart,
                        background: Container(color: Colors.red),
                        onDismissed: (direction) {
                          context.read<TodosProvider>().removeTodo(_todo.id);
                        },
                        child: TodoListCard(
                          todo: _todo,
                          onTap: (todo) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (_) {
                                  return ChangeNotifierProvider<
                                      TodosProvider>.value(
                                    value: context.read<TodosProvider>(),
                                    child: TodosFormScreen(
                                      todo: todo,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
