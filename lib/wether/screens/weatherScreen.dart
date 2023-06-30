import 'package:bloc_practicals/wether/bloc/weather_events.dart';
import 'package:bloc_practicals/wether/bloc/weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: WeatherScreen(),
        ),
      ),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final weatherBloc = context.read<WeatherBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              onSubmitted: (value) {
                weatherBloc.add(FetchWeatherEvent(value));
                textEditingController.clear();
              },
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.black12,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<WeatherBloc, WeatherState>(
                listener: (context, state) {
                  if (state is WeatherSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success!!!')));
                  }
                },
                builder: (context, state) {
                  if (state is WeatherSuccessState) {
                    return Column(
                      children: [
                        Text(state.weatherInfo.name.toString()),
                        Text(state.weatherInfo.temp.toString()),
                        Text(state.weatherInfo.main.toString()),
                      ],
                    );
                  }
                  else if (state is WeatherErrorState) {
                    return Text('Error Occured');
                  } else if (state is WeatherLoadingState) {
                    return Text('Loading');
                  }
                  return Container();
                }
            ),
          ],
        ),
      ),
    );
  }
}
