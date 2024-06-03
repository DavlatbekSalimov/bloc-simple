part of 'counter_bloc.dart';
@immutable
abstract class CounterState {
  final int count;

  const CounterState(this.count);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

class CounterValue extends CounterState {
  const CounterValue(super.count);
}
