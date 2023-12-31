import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/blocs/bloc/counter_bloc.dart';
import 'package:my_counter_cubit/blocs/bloc/counter_event.dart';
import 'package:my_counter_cubit/cubits/counter/counter_cubit.dart';
import 'package:my_counter_cubit/cubits/counter/counter_state.dart';
import 'package:my_counter_cubit/other.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
          title: 'My Counter Cubit',
          debugShowCheckedModeBanner: false,
          home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text('State is ${state.counter}'),
                    ));
          } else if (state.counter == -1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtherPage(),
              ),
            );
          }
        },
        child: Center(
          child: Text(
            '${context.watch<CounterBloc>().state.counter}',
            style: TextStyle(fontSize: 52),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementCounterEvent());
            },
            child: Icon(Icons.add),
            heroTag: 'increment',
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(DecrementCounterEvent());
            },
            child: Icon(Icons.remove),
            heroTag: 'decrement',
          )
        ],
      ),
    );
  }
}
