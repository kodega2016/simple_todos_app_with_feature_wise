import 'package:explore_provider/src/features/todos/presentation/views/todos_screen.dart';
import 'package:flutter/material.dart';

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0.5),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const TodosScreen(),
    );
  }
}
