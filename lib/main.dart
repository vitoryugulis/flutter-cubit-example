import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movielist/app.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/bloc/series_cubit.dart';
import 'package:movielist/data/repositories/movie_repository.dart';
import 'package:movielist/data/repositories/series_repository.dart';
import 'package:movielist/ui/home_page.dart';

void main() async {

  await dotenv.load(fileName: ".env");
  var seriesCubit = SeriesCubit(new SeriesRepository());
  var movieCubit = MovieCubit(new MovieRepository());
  await _loadAppData(seriesCubit, movieCubit);
  runApp(App(movieCubit, seriesCubit));
}

Future _loadAppData(SeriesCubit seriesCubit, MovieCubit movieCubit) async {
  return await Future.wait([
    seriesCubit.getHomePageSeries(),
    movieCubit.getHomePageMovies()
  ]);
}