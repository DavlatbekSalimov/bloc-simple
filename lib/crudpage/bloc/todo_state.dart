part of 'todo_bloc.dart';

@immutable
abstract class TodoState {
  final List<TodoModel>? todos;
  const TodoState(this.todos);
}

class TodoInitial extends TodoState {
  const TodoInitial() : super(null);
}

class TodoUpdate extends TodoState {
  @override
  final List<TodoModel> todos;

  const TodoUpdate(this.todos) : super(todos);
}


class TodoLoading extends TodoState {
  const TodoLoading():super(null);
}


class TodoLoaded extends TodoState {
  @override
  final List<TodoModel> todos;

  const TodoLoaded(this.todos):super(null);
}

class TodoError extends TodoState {
  final String message;

  const TodoError(this.message):super(null);
}