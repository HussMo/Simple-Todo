import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/todo/presentation/bloc/todo_bloc.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('My Daily Todos')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'Add Todo',
                        hintText: 'Add Todo'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<TodoBloc>(context)
                        .add(AddTodoEvent(todo: controller.text));
                    controller.clear();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<TodoBloc,TodoState>(builder: (context, state) {
                if (state is TodoInitial) {
                  return const Center(
                    child: Text(
                      "No Tasks For Now",
                    ),
                  );
                } else if (state is TodoLoaded) {
                  return ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(state.todos[index]),
                            trailing: IconButton(
                              onPressed: () {
                                BlocProvider.of<TodoBloc>(context).add(
                                  RemoveTodoEvent(index: index),
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ));
                      });
                }
              
                return Container();
              }),
            )
          ],
        ),
      ),
    );
  }
}
