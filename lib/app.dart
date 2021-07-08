
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/bloc/genres_cubit.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/bloc/series_cubit.dart';
import 'package:movielist/ui/home/home_page.dart';


class App extends StatelessWidget {
  final MovieCubit movieCubit;
  final SeriesCubit seriesCubit;
  final GenresCubit genresCubit;

  App(this.movieCubit, this.seriesCubit, this.genresCubit);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black,
        ),
        home: MultiBlocProvider(
          providers: [
            _blocProvider(movieCubit),
            _blocProvider(seriesCubit),
            _blocProvider(genresCubit)
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