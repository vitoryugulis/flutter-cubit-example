
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movielist/bloc/genres_cubit.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/bloc/series_cubit.dart';
import 'package:movielist/ui/home/app_error_page.dart';
import 'package:movielist/ui/home/home_page.dart';


class App extends StatelessWidget {
  final MovieCubit movieCubit;
  final SeriesCubit seriesCubit;
  final GenresCubit genresCubit;
  final bool hasLoadingError;

  App(this.movieCubit, this.seriesCubit, this.genresCubit, this.hasLoadingError);

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
          child: hasLoadingError? AppErrorPage() : HomePage(),
        )
    );
  }

  _blocProvider<T extends BlocBase<Object?>>(T cubit){
    return BlocProvider<T>(
      create: (BuildContext context) => cubit,
    );
  }
}