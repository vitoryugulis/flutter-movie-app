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
          page: json['page'] ?? '',
          results: List<ResultModel>.from(
            json['results']?.map((x) => ResultModel.fromJson(x)),
          ),
          totalPages: json['total_pages'] ?? '',
          totalResults: json['total_results'] ?? '',
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

class ResultModel extends ResultEntity {
  ResultModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.firstAirDate,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  ResultModel.fromJson(Map<String, dynamic> json)
      : super(
          adult: json['adult'] ?? '',
          backdropPath: json['backdrop_path'] ?? '',
          genreIds: List<int>.from(json['genre_ids'] ?? []),
          id: json['id'] ?? '',
          originalLanguage: json['original_language'] ?? '',
          originalTitle: json['original_title'] ?? '',
          firstAirDate: json['first_air_date'] ?? '',
          overview: json['overview'] ?? '',
          popularity: json['popularity'] ?? 0,
          posterPath: json['poster_path'] ?? '',
          releaseDate: json['release_date'] ?? '',
          title: json['title'] ?? '',
          video: json['video'] ?? false,
          voteAverage: json['vote_average'] ?? 0,
          voteCount: json['vote_count'] ?? 0,
        );

  ResultModel.fromResultEntity(ResultEntity entity)
      : this(
          adult: entity.adult,
          backdropPath: entity.backdropPath,
          genreIds: entity.genreIds,
          id: entity.id,
          originalLanguage: entity.originalLanguage,
          originalTitle: entity.originalTitle,
          firstAirDate: entity.firstAirDate,
          overview: entity.overview,
          popularity: entity.popularity,
          posterPath: entity.posterPath,
          releaseDate: entity.releaseDate,
          title: entity.title,
          video: entity.video,
          voteAverage: entity.voteAverage,
          voteCount: entity.voteCount,
        );

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'first_air_date': firstAirDate,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
