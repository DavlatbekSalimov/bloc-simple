import 'package:blocappf/data/todomodel.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TodoServerState {}

class TodoServerInitial extends TodoServerState {}

class TodoServerLoading extends TodoServerState {}

class TodoServerLoaded extends TodoServerState {
  final List<TodoModel> todos;

  TodoServerLoaded(this.todos);
}

class TodoServerError extends TodoServerState {
  final String message;

  TodoServerError(this.message);
}
