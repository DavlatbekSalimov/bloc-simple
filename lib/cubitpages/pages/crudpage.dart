import 'package:blocappf/crudpage/bloc/todo_bloc.dart';
import 'package:blocappf/cubitpages/cubit/counter_cubit.dart';
import 'package:blocappf/data/todomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrudPageCubit extends StatelessWidget {
  const CrudPageCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List in Cubit'),
      ),
      body: BlocBuilder<CrudCubit, List<TodoModel>>(
        builder: (context, state) {
       var   tasks = state;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.indigoAccent,
                  child: ListTile(
                    title: Text(tasks[index].name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<CrudCubit>().deleteTodoAt(index);
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
                                            context.read<CrudCubit>().updateTodoAt(
                                                  index,
                                                  TodoModel(
                                                    id: tasks[index].id,
                                                    name: task.text,
                                                    phonenumber: tasks[index].phonenumber,
                                                  ),
                                                );
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
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          FloatingActionButton(
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
                              context.read<CrudCubit>().addTodo(
                                    TodoModel(
                                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                                      name: taskNameController.text,
                                      phonenumber: taskPhoneController.text,
                                    ),
                                  );
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
        ],
      ),
    );
  }
}
