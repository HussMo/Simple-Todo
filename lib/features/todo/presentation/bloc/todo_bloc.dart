import 'package:bloc/bloc.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todos = [];
  TodoBloc() : super(TodoInitial()) {
    on<AddTodoEvent>((event, emit) {
      todos.add(event.todo);
      emit(TodoLoaded(todos: todos));
    });

    on<RemoveTodoEvent>((event, emit) {
      todos.removeAt(event.index);
      emit(TodoLoaded(todos: todos));
    });
  }
}
