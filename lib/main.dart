import 'package:app_todo_xd/screens/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:app_todo_xd/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: ToDoListPage(),
      home: LoginPage(),
    );
  }
}
