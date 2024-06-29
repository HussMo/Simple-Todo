import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_list/features/todo/presentation/pages/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child:  HomeView(),
      ),
    );
  }
}
