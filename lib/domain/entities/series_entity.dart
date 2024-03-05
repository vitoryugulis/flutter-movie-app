import 'package:flutter_movie_app/domain/entities/series_genres_entity.dart';

class SeriesEntity {
  SeriesEntity({
    required this.name,
    required this.genres,
    required this.backdropPath,
    required this.createdBy,
    required this.firstAirDate,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.overview,
  });
  int voteCount;
  String name;
  double voteAverage;
  String firstAirDate;
  List<SeriesGenresEntity> genres;
  List<CreatedByEntity> createdBy;
  String backdropPath;
  String posterPath;
  String overview;
}

class CreatedByEntity {
  CreatedByEntity({
    required this.id,
    required this.creditId,
    required this.name,
    required this.gender,
    this.profilePath,
  });
  int id;
  String creditId;
  String name;
  int gender;
  String? profilePath;
}
