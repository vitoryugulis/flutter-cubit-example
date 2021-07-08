import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movielist/data/models/home_page_movies.dart';
import 'package:movielist/data/models/movie.dart';
import 'package:movielist/data/repositories/movie_repository.dart';

part 'movie_states.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;
  HomePageMovies? homePageMovies;

  MovieCubit(this._movieRepository) : super(MovieInitial());

  Future<HomePageMovies> getHomePageMovies() async {
    try{
      emit(MovieLoading());
      var responses = await Future.wait<PaginatedMovies>([
        _getPopular(), _getLatest(), _getTopRated(),
        _getUpcoming(), _getNowPlaying()
      ]);
      var popular = responses[0].results;
      var latest = responses[1].results;
      var topRated = responses[2].results;
      var upcoming = responses[3].results;
      var nowPlaying = responses[3].results;
      var data = new HomePageMovies(
          popular, latest.first, nowPlaying, topRated, upcoming
      );
      emit(MovieLoaded(data));
      homePageMovies = data;
      return data;
    } on Exception catch(e){
      emit(MovieError("Couldn't fetch movie. Is the device online?"));
      throw new Exception(e);
    }
  }

  Future<PaginatedMovies> _getLatest() async {
    try {
      final response = await _movieRepository.getLatest();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = Movie.fromJson(json);
      var paginatedMovies = new PaginatedMovies(1, null, [data]);
      return paginatedMovies;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedMovies> _getPopular() async {
    try {
      final response = await _movieRepository.popular();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedMovies.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedMovies> _getTopRated() async {
    try {
      final response = await _movieRepository.topRated();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedMovies.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedMovies> _getUpcoming() async {
    try {
      final response = await _movieRepository.upcoming();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedMovies.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedMovies> _getNowPlaying() async {
    try {
      final response = await _movieRepository.nowPlaying();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedMovies.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

  Future<Movie> getById(int id) async {
    try {
      emit(MovieLoading());
      final response = await _movieRepository.getById(id);
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = Movie.fromJson(json);
      emit(MovieDetailsLoaded(data));
      return data;
    } on Exception {
      emit(MovieError("Error fetching movie data"));
      throw new Exception();
    }
  }
}