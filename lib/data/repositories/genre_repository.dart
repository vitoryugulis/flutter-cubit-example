import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'caller.dart';

class GenresRepository {
  var _caller = new Caller();
  String _apiUrl = dotenv.env['API_URL']!;

  Future<Response> getGenres(){
    var url = "$_apiUrl/genre/movie/list";
    return _caller.get(url);
  }
}