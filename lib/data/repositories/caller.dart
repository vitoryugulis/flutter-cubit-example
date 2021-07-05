import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class Caller {

  Client _client = new Client();
  Duration _duration = new Duration(seconds: 10);
  String apiKey = dotenv.env["API_KEY"]!;

  Future<Response> get(String url, {Duration? duration}){
    var uri = Uri.parse("$url?api_key=$apiKey");
    return _client.get(uri).timeout(duration?? this._duration);
  }

  post(String url, String body, {Duration? duration}){
    var uri = Uri.parse("$url?api_key=$apiKey");
    return _client.post(uri, body: body).timeout(duration?? this._duration);
  }
}