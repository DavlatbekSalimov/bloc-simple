import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocappf/crudpage/controller/todo_ctr.dart';
import 'package:blocappf/data/todomodel.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo repo;
  
  late final StreamSubscription<List<TodoModel>> _todoSubscription;

  TodoBloc(this.repo) : super(const TodoInitial()) {
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_deleteTodo);
    on<UpdateTodo>(_updateTodo);
    on<UpdateTodos>(_updateTodos);

 

    _todoSubscription = repo.subscribeToStream().listen((todos) {
      add(UpdateTodos(todos));
    });
  }

  void _addTodo(AddTodo event, Emitter<TodoState> emit) {
    repo.addNewTodo(event.todo);
  }

  void _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    repo.deleteTodoAt(event.index);
  }

  void _updateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    repo.updateTodoAt(event.index, event.todo);
  }

  void _updateTodos(UpdateTodos event, Emitter<TodoState> emit) {
    emit(TodoUpdate(event.todos));
  }

  @override
  Future<void> close() {
    _todoSubscription.cancel();
    repo.dispose();
    return super.close();
  }
}
