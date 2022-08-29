import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(CounterState(count: state.count - 1));
    });
  }
}
