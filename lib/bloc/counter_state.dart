part of 'counter_bloc.dart';

class CounterState {
  final int count;
  const CounterState({required this.count});
}

class CounterInitialState extends CounterState {
  CounterInitialState() : super(count: 0);
}
