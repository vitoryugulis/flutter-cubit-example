import 'package:json_annotation/json_annotation.dart';
part 'series.g.dart';

@JsonSerializable()
class Series {
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "created_by")
  List<String>? createdBy;
  @JsonKey(name: "episode_run_time")
  List<int>? episodeRunTime;
  @JsonKey(name: "first_air_date")
  String? firstAirDate;
  List<Genres>? genres;
  String? homepage;
  int? id;
  @JsonKey(name: "in_production")
  bool? inProduction;
  List<String>? languages;
  @JsonKey(name: "last_air_date")
  String? lastAirDate;
  @JsonKey(name: "last_episode_to_air")
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  @JsonKey(name: "next_episode_to_air")
  String? nextEpisodeToAir;
  @JsonKey(name: "number_of_episodes")
  int? numberOfEpisodes;
  @JsonKey(name: "number_of_seasons")
  int? numberOfSeasons;
  @JsonKey(name: "origin_country")
  List<String>? originCountry;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_name")
  String? originalName;
  String? overview;
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "production_companies")
  List<String>? productionCompanies;
  @JsonKey(name: "production_countries")
  List<ProductionCountries>? productionCountries;
  List<Seasons>? seasons;
  @JsonKey(name: "spoken_languages")
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;
  @JsonKey(ignore: true)
  String get posterImage {
    return "https://image.tmdb.org/t/p/w500/${this.posterPath}";
  }
  @JsonKey(ignore: true)
  bool get hasPosterImage {
    return posterPath == null? false : true;
  }

  Series(
      {this.backdropPath,
        this.createdBy,
        this.episodeRunTime,
        this.firstAirDate,
        this.genres,
        this.homepage,
        this.id,
        this.inProduction,
        this.languages,
        this.lastAirDate,
        this.lastEpisodeToAir,
        this.name,
        this.nextEpisodeToAir,
        this.numberOfEpisodes,
        this.numberOfSeasons,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.seasons,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.type,
        this.voteAverage,
        this.voteCount});

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}

@JsonSerializable()
class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class LastEpisodeToAir {
  String? airDate;
  int? episodeNumber;
  int? id;
  String? name;
  String? overview;
  String? productionCode;
  int? seasonNumber;
  String? stillPath;
  int? voteAverage;
  int? voteCount;

  LastEpisodeToAir(
      {this.airDate,
        this.episodeNumber,
        this.id,
        this.name,
        this.overview,
        this.productionCode,
        this.seasonNumber,
        this.stillPath,
        this.voteAverage,
        this.voteCount});

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) => _$LastEpisodeToAirFromJson(json);
  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}

@JsonSerializable()
class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) => _$ProductionCountriesFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}

@JsonSerializable()
class Seasons {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;

  Seasons(
      {this.airDate,
        this.episodeCount,
        this.id,
        this.name,
        this.overview,
        this.posterPath,
        this.seasonNumber});

  factory Seasons.fromJson(Map<String, dynamic> json) => _$SeasonsFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonsToJson(this);
}

@JsonSerializable()
class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) => _$SpokenLanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}

@JsonSerializable()
class PaginatedSeries {

  int page;
  List<Series> results;
  PaginatedSeries(this.page, this.results);

  factory PaginatedSeries.fromJson(Map<String, dynamic> json) => _$PaginatedSeriesFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedSeriesToJson(this);
}