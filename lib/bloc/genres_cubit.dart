import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movielist/data/models/genre.dart';
import 'package:movielist/data/models/home_page_series.dart';
import 'package:movielist/data/models/series.dart';
import 'package:movielist/data/repositories/genre_repository.dart';
import 'package:movielist/data/repositories/series_repository.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final GenresRepository _genresRepository;
  List<Genre>? genres;
  GenresCubit(this._genresRepository) : super(GenresInitial());

  Future<List<Genre>> getGenres() async {
    try {
      emit(GenresLoading());
      final response = await _genresRepository.getGenres();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = GenreList.fromJson(json);
      emit(GenresLoaded(data.genres));
      genres = data.genres;
      return data.genres;
    } on Exception {
      emit(GenresError("Couldn't fetch genres. Is the device online?"));
      throw new Exception();
    }
  }

}