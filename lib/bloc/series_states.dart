part of 'series_cubit.dart';

@immutable
abstract class SeriesState {
  const SeriesState();
}

class SeriesInitial extends SeriesState {
  const SeriesInitial();
}

class SeriesLoading extends SeriesState {
  const SeriesLoading();
}

class SeriesLoaded extends SeriesState {
  final HomePageSeries data;
  const SeriesLoaded(this.data);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SeriesLoaded && o.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}
class SeriesDetailsLoaded extends SeriesState {
  final Series data;
  const SeriesDetailsLoaded(this.data);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SeriesDetailsLoaded && o.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class SeriesError extends SeriesState {
  final String message;
  const SeriesError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SeriesError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}