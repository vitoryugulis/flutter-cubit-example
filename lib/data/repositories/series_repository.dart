import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'caller.dart';

class SeriesRepository {
  var _caller = new Caller();
  String _apiUrl = dotenv.env['API_URL']!;

  Future<Response> getLatest(){
    var url = "$_apiUrl/tv/latest";
    return _caller.get(url);
  }

  Future<Response> popular(){
    var url = "$_apiUrl/tv/popular";
    return _caller.get(url);
  }

  Future<Response> topRated(){
    var url = "$_apiUrl/tv/top_rated";
    return _caller.get(url);
  }

  Future<Response> onTheAir() {
    var url = "$_apiUrl/tv/on_the_air";
    return _caller.get(url);
  }

  Future<Response> airingToday(){
    var url = "$_apiUrl/tv/airing_today";
    return _caller.get(url);
  }
}