import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/providers/active_todo_count.dart';
import 'package:todolist/providers/providers.dart';

import 'Pages/todo_pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoFiter>(create: (context) => TodoFiter(),),
        ChangeNotifierProvider<TodoSearch>(create: (context) => TodoSearch(),),
        ChangeNotifierProvider<TodoList>(create: (context) => TodoList(),),
        ChangeNotifierProxyProvider<TodoList, ActiveTodoCount>(create: (context) => ActiveTodoCount(),
            update:(BuildContext context, TodoList todoList, ActiveTodoCount? activeTodoCount) => activeTodoCount!..update(todoList),)
        // ChangeNotifierProxyProvider3<TodoList , TodoSearch , TodoFiter , FilteredTodos>(create: (context) => FilteredTodos(), )
      ],
      child: MaterialApp(
        title: 'TODOS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodosPage(),
      ),
    );
  }
}
