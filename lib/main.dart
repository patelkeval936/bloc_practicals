import 'dart:async';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  Future<void> increment() async  {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      emit(state + 1);
    }
  }

  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}

class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
  }
}

void main() async {

  final counterBloc = CounterBloc();
  print(counterBloc.state);

  CounterIncrementPressed counterIncrementPressed = CounterIncrementPressed();
  counterBloc.add(counterIncrementPressed);

  print(counterBloc.state);

  await Future.delayed(Duration(seconds: 0));

  counterBloc.add(counterIncrementPressed);
  counterBloc.add(counterIncrementPressed);
  counterBloc.add(counterIncrementPressed);
  counterBloc.add(counterIncrementPressed);

  print(counterBloc.state);

  await Future.delayed(Duration(seconds: 0));

  print(counterBloc.state);
  await counterBloc.close();

  // final cubit1 = CounterCubit(10);
  //
  // StreamSubscription s1 = cubit1.stream.listen((event) {
  //   print(event);
  // });
  //
  // await cubit1.increment();
  //
  //
  // s1.cancel();
  // cubit1.close();
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My BLoC Project',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   Stream<int> countStream(int max) async* {
//     for (int i = 0; i < max; i++) {
//       await Future.delayed(Duration(milliseconds: 500));
//       yield i;
//     }
//   }
//
//   Future<int> sumStream(Stream<int> stream) async {
//     int sum = 0;
//     await for (int value in stream) {
//       print(value);
//       sum += value;
//     }
//     return sum;
//   }
//
//   void run() async {
//     Stream<int> stream = countStream(10);
//
//     /// Compute the sum of the stream of integers
//     int sum = await sumStream(stream);
//
//     /// Print the sum
//     print(sum); // 45
//   }
//
//   @override
//   void initState() {
//     run();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('HomePage'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
