import 'package:movielist/data/models/series.dart';

class HomePageSeries {
  List<Series> airingToday;
  List<Series> topRated;
  List<Series> onTheAir;
  List<Series> popular;
  Series latest;

  HomePageSeries(
    this.popular,
    this.latest,
    this.onTheAir,
    this.topRated,
    this.airingToday,
  );

}