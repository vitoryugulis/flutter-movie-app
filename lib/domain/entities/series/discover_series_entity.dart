import 'package:flutter_movie_app/domain/entities/discover_entity.dart';

class DiscoverSeriesEntity {
  DiscoverSeriesEntity({
    required this.airingToday,
    required this.onTheAir,
    required this.popular,
    required this.topRated,
  });
  DiscoverEntity airingToday;
  DiscoverEntity onTheAir;
  DiscoverEntity popular;
  DiscoverEntity topRated;
}
