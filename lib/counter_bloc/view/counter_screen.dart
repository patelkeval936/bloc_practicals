import 'package:bloc_practicals/counter_bloc/bloc/counter_bloc.dart';
import 'package:bloc_practicals/counter_bloc/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/counter_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Counter Using BLoC'),
            centerTitle: true,
          ),
          body: CounterScreen(),
        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                print('item builder $index');
                if(index % 2 == 0){
                  return BlocBuilder<CounterBloc,CounterState>(
                    builder: (context, state) {
                      print('bloc builder $index');
                      return Text(
                        'C1 : ${state.count1}',
                        style: Theme.of(context).textTheme.titleLarge,
                      );
                    },
                  );
                }else{
                     return BlocBuilder<CounterBloc,CounterState>(
                        builder: (context, state) {
                          print('bloc builder $index');
                          return Text(
                            'C2 : ${state.count2}',
                            style: Theme.of(context).textTheme.titleLarge,
                          );
                        },
                      );
                }
              },
              shrinkWrap: true,
            )
            // ListView(
            //   shrinkWrap: true,
            //   children: [
            //         BlocSelector<CounterBloc, CounterState, int>(
            //           selector: (state) {
            //             print('bloc selector 1');
            //             return state.count1;
            //           },
            //           builder: (context, state) {
            //             print('bloc builder 1');
            //             return Text(
            //               'C1 : ${state}',
            //               style: Theme.of(context).textTheme.titleLarge,
            //             );
            //           },
            //         ),
            //         BlocSelector<CounterBloc, CounterState, int>(
            //           selector: (state) {
            //             print('bloc selector 2');
            //             return state.count2;
            //           },
            //           builder: (context, state) {
            //             print('bloc builder 2');
            //             return Text(
            //               'C2 : ${state}',
            //               style: Theme.of(context).textTheme.titleLarge,
            //             );
            //           },
            //         ),
            //   ],
            // )
            // Text(context.watch<CounterBloc>().state.count1.toString()),
            // BlocBuilder<CounterBloc, CounterState>(
            //   builder: (context, state) {
            //     print('builder runs');
            //     return Text(
            //       'C1 : ${state.count1}',
            //       style: Theme.of(context).textTheme.titleLarge,
            //     );
            //   },
            // )
            // BlocListener<CounterBloc, CounterState>(
            //   listener: (context, state) {
            //     print('bloc listener ');
            //     // print('Bloc Listener : Builder ${state.count1}');
            //     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.count1.toString())));
            //   },
            //   child: const MyText(),
            //   // child: Text('hello'),
            // ),
            // BlocConsumer<CounterBloc, CounterState>(
            //   bloc: BlocProvider.of<CounterBloc>(context),
            //   listener: (context, state) {
            //     print('Listener : C1 : ${state.count1}');
            //     print('Listener : C2 : ${state.count2}');
            //   },
            //   builder: (context, state) {
            //     print('Builder : C1 : ${state.count1}');
            //     print('Builder : C2 : ${state.count2}');
            //     return Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Text(
            //           'C1 : ${state.count1}',
            //           style: Theme.of(context).textTheme.titleLarge,
            //         ),
            //         Text(
            //           'C2 : ${state.count2}',
            //           style: Theme.of(context).textTheme.titleLarge,
            //         ),
            //       ],
            //     );
            //   },
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     BlocSelector<CounterBloc, CounterState, int>(
            //       selector: (state) {
            //         print('bloc selector 1');
            //         return state.count1;
            //       },
            //       builder: (context, state) {
            //         print('bloc builder 1');
            //         return Text(
            //           'C1 : ${state}',
            //           style: Theme.of(context).textTheme.titleLarge,
            //         );
            //       },
            //     ),
            //     BlocSelector<CounterBloc, CounterState, int>(
            //       selector: (state) {
            //         print('bloc selector 2');
            //         return state.count2;
            //       },
            //       builder: (context, state) {
            //         print('bloc builder 2');
            //         return Text(
            //           'C2 : ${state}',
            //           style: Theme.of(context).textTheme.titleLarge,
            //         );
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CountIncrementEvent());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(CountDecrementEvent());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class MyText extends StatefulWidget {
  const MyText({super.key});

  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {

  @override
  Widget build(BuildContext context) {
    print('running build of myText');
    return Text('hello');
  }

}
