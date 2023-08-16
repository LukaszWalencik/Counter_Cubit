import 'package:bloc/bloc.dart';
import 'package:my_counter_cubit/blocs/bloc/counter_event.dart';
import 'package:my_counter_cubit/cubits/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>(_decrementCounter);
  }
  void _decrementCounter(
      DecrementCounterEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
