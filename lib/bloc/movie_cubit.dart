import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movielist/data/models/movie.dart';
import 'package:movielist/data/repositories/tmdb_repository.dart';

part 'movie_states.dart';

class MovieCubit extends Cubit<MovieState> {
  final TmdbRepository _tmdbRepository;

  MovieCubit(this._tmdbRepository) : super(MovieInitial());

  Future<Movie> getLatest() async {
    try {
      emit(MovieLoading());
      final response = await _tmdbRepository.getLatest();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var movie = Movie.fromJson(json);
      emit(MovieLoaded(movie));
      return movie;
    } on HttpException {
      emit(MovieError("Couldn't fetch weather. Is the device online?"));
      return new Movie();
    }
  }
}