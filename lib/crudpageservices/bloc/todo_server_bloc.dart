import 'package:bloc/bloc.dart';
import 'package:blocappf/crudpageservices/bloc/todo_server_state.dart';
import 'package:blocappf/services/todo_services.dart';
import 'package:meta/meta.dart';

part 'todo_server_event.dart';

class TodoServerBloc extends Bloc<TodoServerEvent, TodoServerState> {
  TodoServerBloc() : super(TodoServerInitial()) {
    on<FetchTodoServer>(_onFetchTodoServer);
  }

  Future<void> _onFetchTodoServer(FetchTodoServer event, Emitter<TodoServerState> emit) async {
    NetworkService networkService = NetworkService();
    emit(TodoServerLoading());
    try {
      final todos = await networkService.getData();
      emit(TodoServerLoaded(todos));
    } catch (e) {
      emit(TodoServerError(e.toString()));
    }
  }
}
