part of 'todo_bloc.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String todo;
  AddTodoEvent({required this.todo});
}

class RemoveTodoEvent extends TodoEvent {
  final int index;
  RemoveTodoEvent({required this.index});
}

