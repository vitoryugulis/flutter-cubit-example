part of 'movie_cubit.dart';

@immutable
abstract class MovieState {
  const MovieState();
}

class MovieInitial extends MovieState {
  const MovieInitial();
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieLoaded extends MovieState {
  final Movie movie;
  const MovieLoaded(this.movie);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieLoaded && o.movie == movie;
  }

  @override
  int get hashCode => movie.hashCode;
}

class PaginatedMoviesLoaded extends MovieState {
  final PaginatedMovies movies;
  const PaginatedMoviesLoaded(this.movies);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaginatedMoviesLoaded && o.movies == movies;
  }

  @override
  int get hashCode => movies.hashCode;
}

class MovieError extends MovieState {
  final String message;
  const MovieError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}