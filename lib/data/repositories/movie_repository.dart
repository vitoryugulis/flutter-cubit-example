import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'caller.dart';

class MovieRepository {
  var _caller = new Caller();
  String _apiUrl = dotenv.env['API_URL']!;

  Future<Response> getLatest(){
    var url = "$_apiUrl/movie/latest";
    return _caller.get(url);
  }

  Future<Response> popular(){
    var url = "$_apiUrl/movie/popular";
    return _caller.get(url);
  }

  Future<Response> topRated(){
    var url = "$_apiUrl/movie/top_rated";
    return _caller.get(url);
  }

  Future<Response> upcoming(){
    var url = "$_apiUrl/movie/upcoming";
    return _caller.get(url);
  }

  Future<Response> nowPlaying(){
    var url = "$_apiUrl/movie/now_playing";
    return _caller.get(url);
  }
}