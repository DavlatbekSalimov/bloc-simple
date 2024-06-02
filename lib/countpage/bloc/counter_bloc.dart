import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementCounter>(_incrementCounter);
    on<DecrementCounter>(_decrementCounter);
  }

  void _incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(CounterValue(state.count + 1));
  }

  void _decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    if (state.count > 0) {
      emit(CounterValue(state.count - 1));
    }
  }
}
