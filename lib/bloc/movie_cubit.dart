import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movielist/data/models/movie.dart';
import 'package:movielist/data/repositories/movie_repository.dart';

part 'movie_states.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;

  MovieCubit(this._movieRepository) : super(MovieInitial());

  Future<Movie> getLatest() async {
    try {
      emit(MovieLoading());
      final response = await _movieRepository.getLatest();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var movie = Movie.fromJson(json);
      emit(MovieLoaded(movie));
      return movie;
    } on Exception {
      emit(MovieError("Couldn't fetch movie. Is the device online?"));
      throw new Exception();
    }
  }

  Future<PaginatedMovies> popular() async {
    try {
      emit(MovieLoading());
      final response = await _movieRepository.popular();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedMovies.fromJson(json);
      emit(PaginatedMoviesLoaded(data));
      return data;
    } on Exception {
      emit(MovieError("Couldn't fetch movie. Is the device online?"));
      throw new Exception();
    }
  }

  Future<PaginatedMovies> topRated() async {
    try {
      emit(MovieLoading());
      final response = await _movieRepository.popular();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedMovies.fromJson(json);
      emit(PaginatedMoviesLoaded(data));
      return data;
    } on Exception {
      emit(MovieError("Couldn't fetch movie. Is the device online?"));
      throw new Exception();
    }
  }

  Future<PaginatedMovies> upcoming() async {
    try {
      emit(MovieLoading());
      final response = await _movieRepository.popular();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedMovies.fromJson(json);
      emit(PaginatedMoviesLoaded(data));
      return data;
    } on Exception {
      emit(MovieError("Couldn't fetch movie. Is the device online?"));
      throw new Exception();
    }
  }
}