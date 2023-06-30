import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class Parent extends Cubit<int> {
  Parent(super.initialState);

  Future<void> increment() async {
    emit(state + 1);
    // for (int i = 0; i < 10; i++) {
    //   await Future.delayed(const Duration(seconds: 1));
    //   emit(state + 1);
    // }
  }

  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}

class Child extends Parent {
  Child() : super(0);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Child(),
      child: MaterialApp(
        title: 'My BLoC Project',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              (context.watch<Child>() as Parent).state.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    Child p = context.read<Child>()..increment();
                    Parent c = p as Parent;
                    print(c.state.toString());
                  },
                  child: Text('hello'));
            })
          ],
        ),
      ),
    );
  }
}
