import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/movie_genres_entity.dart';
import 'package:flutter_movie_app/domain/entities/series_genres_entity.dart';

class AppConfigurationEntity {
  AppConfigurationEntity({
    required this.details,
    required this.movieGenres,
    required this.seriesGenres,
  });

  late final DetailsEntity details;
  late final MovieGenresEntity movieGenres;
  late final SeriesGenresEntity seriesGenres;
}