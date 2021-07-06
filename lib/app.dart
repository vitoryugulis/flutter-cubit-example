
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/bloc/series_cubit.dart';
import 'package:movielist/ui/home_page.dart';


class App extends StatelessWidget {
  final MovieCubit movieCubit;
  final SeriesCubit seriesCubit;

  App(this.movieCubit, this.seriesCubit);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            _blocProvider(movieCubit),
            _blocProvider(seriesCubit)
          ],
          child: HomePage(),
        )
    );
  }

  _blocProvider<T extends BlocBase<Object?>>(T cubit){
    return BlocProvider<T>(
      create: (BuildContext context) => cubit,
    );
  }
}