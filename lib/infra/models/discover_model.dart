import 'package:flutter_movie_app/domain/entities/discover_entity.dart';

class DiscoverModel extends DiscoverEntity {
  DiscoverModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  DiscoverModel.fromJson(Map<String, dynamic> json)
      : super(
          page: json['page'],
          results: List<Results>.from(
              json['results'].map((x) => Results.fromJson(x))),
          totalPages: json['total_pages'],
          totalResults: json['total_results'],
        );

  DiscoverEntity toEntity() {
    return DiscoverEntity(
      page: page,
      results: results,
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}

class Results extends ResultEntity {
  Results({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json)
      : super(
          adult: json['adult'],
          backdropPath: json['backdrop_path'],
          genreIds: List<int>.from(json['genre_ids']),
          id: json['id'],
          originalLanguage: json['original_language'],
          originalTitle: json['original_title'],
          overview: json['overview'],
          popularity: json['popularity'],
          posterPath: json['poster_path'],
          releaseDate: json['release_date'],
          title: json['title'],
          video: json['video'],
          voteAverage: json['vote_average'],
          voteCount: json['vote_count'],
        );
}
