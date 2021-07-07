part of 'genres_cubit.dart';

@immutable
abstract class GenresState {
  const GenresState();
}

class GenresInitial extends GenresState {
  const GenresInitial();
}

class GenresLoading extends GenresState {
  const GenresLoading();
}

class GenresLoaded extends GenresState {
  final List<Genre> data;
  const GenresLoaded(this.data);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GenresLoaded && o.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class GenresError extends GenresState {
  final String message;
  const GenresError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GenresError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}