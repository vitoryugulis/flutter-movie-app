import 'package:flutter_movie_app/domain/entities/movies/discover_movies_entity.dart';

class DiscoverMoviesModel extends DiscoverMoviesEntity {
  DiscoverMoviesModel({
    required super.nowPlaying,
    required super.popular,
    required super.topRated,
    required super.upComing,
  });

  DiscoverMoviesEntity toEntity() {
    return DiscoverMoviesEntity(
      nowPlaying: nowPlaying,
      popular: popular,
      topRated: topRated,
      upComing: upComing,
    );
  }
}
