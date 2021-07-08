import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movielist/data/models/home_page_series.dart';
import 'package:movielist/data/models/series.dart';
import 'package:movielist/data/repositories/series_repository.dart';

part 'series_states.dart';

class SeriesCubit extends Cubit<SeriesState> {
  final SeriesRepository _seriesRepository;
  HomePageSeries? homePageSeries;
  SeriesCubit(this._seriesRepository) : super(SeriesInitial());

  Future<HomePageSeries> getHomePageSeries() async {
    try{
      emit(SeriesLoading());
      var responses = await Future.wait<PaginatedSeries>([
        _getPopular(), _getLatest(), _getOnTheAir(),
        _getTopRated(), _getAiringToday(),
      ]);
      var popular = responses[0].results;
      var latest = responses[1].results;
      var onTheAir = responses[2].results;
      var topRated = responses[3].results;
      var airingToday = responses[4].results;
      var data = new HomePageSeries(
          popular, latest.first, onTheAir, topRated, airingToday
      );
      emit(SeriesLoaded(data));
      homePageSeries = data;
      return data;
    } on Exception catch(e){
      emit(SeriesError("Couldn't fetch movie. Is the device online?"));
      throw new Exception(e);
    }
  }

  Future<PaginatedSeries> _getLatest() async {
    try {
      final response = await _seriesRepository.getLatest();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = Series.fromJson(json);
      var paginatedSeries = new PaginatedSeries(1, [data]);
      return paginatedSeries;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedSeries> _getPopular() async {
    try {
      final response = await _seriesRepository.popular();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedSeries.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedSeries> _getTopRated() async {
    try {
      final response = await _seriesRepository.topRated();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedSeries.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedSeries> _getOnTheAir() async {
    try {
      final response = await _seriesRepository.onTheAir();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedSeries.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

  Future<PaginatedSeries> _getAiringToday() async {
    try {
      final response = await _seriesRepository.airingToday();
      var utf8body = utf8.decode(response.bodyBytes);
      var json = jsonDecode(utf8body);
      var data = PaginatedSeries.fromJson(json);
      return data;
    } on Exception {
      throw new Exception();
    }
  }

}