part of 'todo_bloc.dart';

@immutable
abstract class TodoState {
  final Stream<List<TodoModel>>? todos;
  const TodoState(this.todos);
}

class TodoInitial extends TodoState {
  const TodoInitial() : super(null);
}

class TodoUpdate extends TodoState {
  @override
  final Stream<List<TodoModel>> todos;

  const TodoUpdate(this.todos) : super(todos);
}
