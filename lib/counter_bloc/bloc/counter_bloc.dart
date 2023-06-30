import 'package:bloc/bloc.dart';
import 'package:bloc_practicals/counter_bloc/bloc/counter_event.dart';
import 'package:bloc_practicals/counter_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0,0)) {
    on<CountIncrementEvent>(_increment);
    on<CountDecrementEvent>(_decrement);
  }

  _increment(CountIncrementEvent event, Emitter<CounterState> emit) {
    print(state.count1++);
    emit(CounterState.copyWith(c1: state.count1));
  }

  _decrement(CountDecrementEvent event, Emitter<CounterState> emit) {
    print(state.count2--);
    emit(CounterState.copyWith(c2 : state.count2));
  }
}
