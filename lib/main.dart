import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/data/repositories/movie_repository.dart';
import 'package:movielist/ui/home_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
          providers: _setProviders(),
          child: HomePage()
      ),
    );
  }

  _setProviders(){
    return [
      BlocProvider<MovieCubit>(
        create: (BuildContext context) => MovieCubit(new MovieRepository()),
      ),
    ];
  }
}