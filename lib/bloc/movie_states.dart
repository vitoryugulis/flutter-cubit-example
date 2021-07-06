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
  final HomePageMovies data;
  const MovieLoaded(this.data);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MovieLoaded && o.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class PaginatedMoviesLoaded extends MovieState {
  final PaginatedMovies data;
  const PaginatedMoviesLoaded(this.data);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaginatedMoviesLoaded && o.data == data;
  }

  @override
  int get hashCode => data.hashCode;
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