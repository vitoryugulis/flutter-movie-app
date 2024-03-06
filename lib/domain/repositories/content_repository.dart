import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/movies/discover_movies_entity.dart';
import 'package:flutter_movie_app/domain/entities/movies/movie_genres_entity.dart';
import 'package:flutter_movie_app/domain/entities/series/discover_series_entity.dart';
import 'package:flutter_movie_app/domain/entities/series/series_genres_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContentRepository {
  Future<Either<Exception, MovieGenresEntity>> getMovieGenres();
  Future<Either<Exception, SeriesGenresEntity>> getSeriesGenres();
  Future<Either<Exception, DetailsEntity>> getDetails();
  Future<Either<Exception, DiscoverSeriesEntity>> getSeries();
  Future<Either<Exception, DiscoverMoviesEntity>> getMovies();
}
