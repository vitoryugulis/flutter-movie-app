import 'package:flutter_movie_app/domain/entities/series/discover_series_entity.dart';

class DiscoverSeriesModel extends DiscoverSeriesEntity {
  DiscoverSeriesModel({
    required super.airingToday,
    required super.onTheAir,
    required super.popular,
    required super.topRated,
  });

  DiscoverSeriesEntity toEntity() {
    return DiscoverSeriesEntity(
      airingToday: airingToday,
      onTheAir: onTheAir,
      popular: popular,
      topRated: topRated,
    );
  }
}
