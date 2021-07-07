import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';

@JsonSerializable()
class Genre {
  int? id;
  String? name;

  Genre({
    this.name,
    this.id
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class GenreList {
  final List<Genre> genres;
  GenreList(this.genres);

  factory GenreList.fromJson(Map<String, dynamic> json) => _$GenreListFromJson(json);
  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}