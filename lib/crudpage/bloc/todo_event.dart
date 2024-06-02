part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoModel todo;

  AddTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final int index;

  DeleteTodo(this.index);
}

class UpdateTodo extends TodoEvent {
  final int index;
  final TodoModel todo;

  UpdateTodo(this.index, this.todo);
}

class UpdateTodos extends TodoEvent {
  final List<TodoModel> todos;

  UpdateTodos(this.todos);
}
