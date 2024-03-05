import 'package:flutter_movie_app/domain/entities/movies_entity.dart';
import 'package:flutter_movie_app/infra/models/movie_genres_model.dart';

class MoviesModel extends MoviesEntity {
  MoviesModel({
    required super.backdropPath,
    required super.genres,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.voteCount,
    required super.createdBy,
  });

  MoviesModel.fromJson(Map<String, dynamic> json)
      : super(
          createdBy: List.from(json['created_by'])
              .map((e) => CreatedByModel.fromJson(e))
              .toList(),
          backdropPath: json['backdrop_path'] ?? '',
          genres: (json['genres'] != null)
              ? List.from(json['genres'])
                  .map((e) => MovieGenresModel.fromJson(e))
                  .toList()
              : [],
          originalLanguage: json['original_language'] ?? '',
          originalTitle: json['original_title'] ?? '',
          overview: json['overview'] ?? '',
          posterPath: json['poster_path'] ?? '',
          releaseDate: json['release_date'] ?? '',
          title: json['title'] ?? '',
          voteAverage: json['vote_average'] ?? 0.0,
          voteCount: json['vote_count'] ?? 0,
        );
}
