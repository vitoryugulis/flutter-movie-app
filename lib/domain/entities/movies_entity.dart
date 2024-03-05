import 'package:flutter_movie_app/domain/entities/movie_genres_entity.dart';
import 'package:flutter_movie_app/domain/entities/series_entity.dart';

class MoviesEntity {
  MoviesEntity({
    required this.title,
    required this.genres,
    required this.backdropPath,
    required this.createdBy,
    required this.releaseDate,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.overview,
    required this.originalLanguage,
    required this.originalTitle,
  });
  int voteCount;
  String title;
  double voteAverage;
  String releaseDate;
  List<MovieGenresEntity> genres;
  List<CreatedByEntity> createdBy;
  String backdropPath;
  String posterPath;
  String overview;
  String originalLanguage;
  String originalTitle;
}

class CreatedByModel extends CreatedByEntity {
  CreatedByModel({
    required super.id,
    required super.creditId,
    required super.name,
    required super.gender,
    super.profilePath,
  });

  CreatedByModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          creditId: json['credit_id'],
          name: json['name'],
          gender: json['gender'],
          profilePath: json['profile_path'],
        );
}
