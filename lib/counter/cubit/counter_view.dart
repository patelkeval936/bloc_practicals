import 'package:bloc_practicals/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<CounterCubit>(
      create: (_) => CounterCubit(),
      child: const MaterialApp(
        home: CounterView(),
      ),
    ),
  );
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterCubit,int>(
        builder: (context, state) {
          return Center(child: Text(state.toString(),style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)));
      },),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: () {
            context.read<CounterCubit>().increment();
          },child: Icon(Icons.add),),
          FloatingActionButton(onPressed: () {
            context.read<CounterCubit>().decrement();
          },child: Icon(Icons.remove),),
        ],
      ),
    );
  }
}
