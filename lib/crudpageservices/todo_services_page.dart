import 'package:blocappf/crudpageservices/bloc/todo_server_bloc.dart';
import 'package:blocappf/crudpageservices/bloc/todo_server_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoServerPage extends StatelessWidget {
  const TodoServerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dispatch FetchTodoServer event when the page is built
    context.read<TodoServerBloc>().add(FetchTodoServer());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List (Server)'),
      ),
      body: BlocBuilder<TodoServerBloc, TodoServerState>(
        builder: (context, state) {
          if (state is TodoServerInitial || state is TodoServerLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoServerLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.name),
                  subtitle: Text(todo.phonenumber),
                  // Add more UI elements to display other data as needed
                );
              },
            );
          } else if (state is TodoServerError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
