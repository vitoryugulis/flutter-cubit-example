import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movielist/app.dart';
import 'package:movielist/bloc/genres_cubit.dart';
import 'package:movielist/bloc/movie_cubit.dart';
import 'package:movielist/bloc/series_cubit.dart';
import 'package:movielist/data/repositories/genre_repository.dart';
import 'package:movielist/data/repositories/movie_repository.dart';
import 'package:movielist/data/repositories/series_repository.dart';

void main() async {

  await dotenv.load(fileName: ".env");
  var seriesCubit = SeriesCubit(new SeriesRepository());
  var movieCubit = MovieCubit(new MovieRepository());
  var genresCubit = GenresCubit(new GenresRepository());
  try{
    await _loadAppData(
        seriesCubit,
        movieCubit,
        genresCubit
    );
    runApp(App(movieCubit, seriesCubit, genresCubit, false));
  } on Exception catch(e){
    print(e);
    runApp(App(movieCubit, seriesCubit, genresCubit, true));
  }
}

Future _loadAppData(SeriesCubit seriesCubit, MovieCubit movieCubit, GenresCubit genresCubit) async {
  return await Future.wait([
    seriesCubit.getHomePageSeries(),
    movieCubit.getHomePageMovies(),
    genresCubit.getGenres()
  ]);
}