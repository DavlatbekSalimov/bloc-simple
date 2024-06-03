import 'package:bloc/bloc.dart';
import 'package:blocappf/data/todomodel.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}


class CrudCubit extends Cubit<List<TodoModel>> {
  CrudCubit() : super([]);

  void addTodo(TodoModel todo) {
    final updatedTodos = List<TodoModel>.from(state)..add(todo);
    emit(updatedTodos);
  }

  void updateTodoAt(int index, TodoModel todo) {
    if (index >= 0 && index < state.length) {
      final updatedTodos = List<TodoModel>.from(state)..[index] = todo;
      emit(updatedTodos);
    }
  }

  void deleteTodoAt(int index) {
    if (index >= 0 && index < state.length) {
      final updatedTodos = List<TodoModel>.from(state)..removeAt(index);
      emit(updatedTodos);
    }
  }
}