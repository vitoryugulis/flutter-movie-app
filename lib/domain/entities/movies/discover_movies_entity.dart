import 'package:flutter_movie_app/infra/models/discover_model.dart';

class DiscoverMoviesEntity {
  DiscoverMoviesEntity({
    required this.nowPlaying,
    required this.popular,
    required this.topRated,
    required this.upComing,
  });
  final DiscoverModel nowPlaying;
  final DiscoverModel popular;
  final DiscoverModel topRated;
  final DiscoverModel upComing;
}
