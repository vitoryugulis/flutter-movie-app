import 'package:flutter_movie_app/domain/entities/series_entity.dart';
import 'package:flutter_movie_app/infra/models/series_genres_model.dart';

class SeriesModel extends SeriesEntity {
  SeriesModel({
    required super.backdropPath,
    required super.createdBy,
    required super.firstAirDate,
    required super.genres,
    required super.name,
    required super.posterPath,
    required super.voteAverage,
    required super.voteCount,
    required super.overview,
  });

  SeriesModel.fromJson(Map<String, dynamic> json)
      : super(
          backdropPath: json['backdrop_path'],
          createdBy: List.from(json['created_by'])
              .map((e) => CreatedByModel.fromJson(e))
              .toList(),
          firstAirDate: json['first_air_date'],
          genres: List.from(json['genres'])
              .map((e) => SeriesGenresModel.fromJson(e))
              .toList(),
          name: json['name'],
          overview: json['overview'],
          posterPath: json['poster_path'],
          voteAverage: json['vote_average'],
          voteCount: json['vote_count'],
        );

  SeriesEntity toEntity() {
    return SeriesEntity(
      name: name,
      genres: genres,
      backdropPath: backdropPath,
      createdBy: createdBy,
      firstAirDate: firstAirDate,
      posterPath: posterPath,
      voteAverage: voteAverage,
      voteCount: voteCount,
      overview: overview,
    );
  }
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
