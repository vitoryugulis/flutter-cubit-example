import 'package:movielist/data/models/movie.dart';

class HomePageMovies {
  List<Movie> upcoming;
  List<Movie> topRated;
  List<Movie> nowPlaying;
  List<Movie> popular;
  Movie latest;

  HomePageMovies(
   this.popular,
   this.latest,
   this.nowPlaying,
   this.topRated,
   this.upcoming,
  );

}