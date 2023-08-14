import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_counter_cubit/cubits/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());
}
