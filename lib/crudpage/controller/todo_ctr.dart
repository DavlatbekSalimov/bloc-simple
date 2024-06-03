import 'dart:async';
import 'package:blocappf/data/todomodel.dart';

class TodoRepo {
  List<TodoModel> todos = [];

  final _streamController = StreamController<List<TodoModel>>.broadcast();

  Stream<List<TodoModel>> subscribeToStream() {
    _streamController.sink.add(todos); // Emit current todos initially
    return _streamController.stream;
  }

  void addNewTodo(TodoModel todo) {
    todos.add(todo);
    _streamController.sink.add(todos);
  }

  void deleteTodoAt(int index) {
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
      _streamController.sink.add(todos);
    }
  }

  void updateTodoAt(int index, TodoModel todo) {
    if (index >= 0 && index < todos.length) {
      todos[index] = todo;
      _streamController.sink.add(todos);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
