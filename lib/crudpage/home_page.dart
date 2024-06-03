import 'package:blocappf/crudpage/bloc/todo_bloc.dart';
import 'package:blocappf/data/todomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(child: Text('No Data'));
          } else if (state is TodoUpdate) {
            final tasks = state.todos;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index].name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<TodoBloc>().add(DeleteTodo(index));
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          IconButton(
                            onPressed: () {
                              final task = TextEditingController(text: tasks[index].name);
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: task,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              context.read<TodoBloc>().add(UpdateTodo(
                                                    index,
                                                    TodoModel(
                                                      id: tasks[index].id,
                                                      name: task.text,
                                                      phonenumber: tasks[index].phonenumber,
                                                    ),
                                                  ));
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Save'),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.update),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final taskNameController = TextEditingController();
          final taskPhoneController = TextEditingController();
          showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: taskNameController,
                        decoration: const InputDecoration(labelText: 'Task Name'),
                      ),
                      TextField(
                        controller: taskPhoneController,
                        decoration: const InputDecoration(labelText: 'Phone Number'),
                        keyboardType: TextInputType.phone,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(AddTodo(
                                TodoModel(
                                  id: DateTime.now().millisecondsSinceEpoch,
                                  name: taskNameController.text,
                                  phonenumber: int.parse(taskPhoneController.text),
                                ),
                              ));
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}