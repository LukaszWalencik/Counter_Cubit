import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_counter_cubit/cubits/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
