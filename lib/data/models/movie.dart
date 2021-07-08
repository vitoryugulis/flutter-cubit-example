import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount
  });

  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  int? id;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_title")
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "release_date")
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  @JsonKey(ignore: true)
  String get posterImage {
    return "https://image.tmdb.org/t/p/w500/$posterPath";
  }
  @JsonKey(ignore: true)
  bool get hasPosterImage {
    return posterPath == null? false : true;
  }
  @JsonKey(ignore: true)
  String get backdropImage {
    return "https://image.tmdb.org/t/p/w500/$backdropPath";
  }
  @JsonKey(ignore: true)
  bool get hasBackDropImage {
    return backdropPath == null? false : true;
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class PaginatedMovies {

  MovieDates? dates;
  int? page;
  List<Movie> results;
  PaginatedMovies(this.page, this.dates, this.results);

  factory PaginatedMovies.fromJson(Map<String, dynamic> json) => _$PaginatedMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedMoviesToJson(this);
}

@JsonSerializable()
class MovieDates {

  String minimum;
  String maximum;

  MovieDates(this.maximum, this.minimum);

  factory MovieDates.fromJson(Map<String, dynamic> json) => _$MovieDatesFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDatesToJson(this);
}