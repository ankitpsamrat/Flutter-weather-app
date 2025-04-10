import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/weather_bloc.dart';
import 'package:weather_app/src/screens/results_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 143, 190, 245),
              Color.fromARGB(255, 168, 208, 240),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/mlogo.png'),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherIsNotSearched) {
                  return Column(
                    children: <Widget>[
                      const Text(
                        'Search weather',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: 'Enter country or city name',
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_searchController.text.isNotEmpty) {
                              weatherBloc
                                  .add(FetchWeather(_searchController.text));
                            }
                          },
                          child: const Text(
                            'Search',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is WeatherIsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherIsLoaded) {
                  return ResultScreen(
                    weather: state.weatherModel,
                    city: _searchController.text,
                  );
                } else {
                  return const Text(
                    "Opps! Something went wrong",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
