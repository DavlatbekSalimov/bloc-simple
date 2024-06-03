part of 'todo_server_bloc.dart';

@immutable
abstract class TodoServerEvent {}

class FetchTodoServer extends TodoServerEvent {}
