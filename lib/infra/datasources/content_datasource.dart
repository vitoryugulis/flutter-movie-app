import 'package:flutter_movie_app/infra/models/details_model.dart';
import 'package:flutter_movie_app/infra/models/discover_movies_model.dart';
import 'package:flutter_movie_app/infra/models/discover_series_model.dart';
import 'package:flutter_movie_app/infra/models/movie_genres_model.dart';
import 'package:flutter_movie_app/infra/models/series_genres_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContentDatasource {
  Future<Either<Exception, MovieGenresModel>> getMovieGenres();
  Future<Either<Exception, SeriesGenresModel>> getSeriesGenres();
  Future<Either<Exception, DetailsModel>> getConfiguration();

  Future<Either<Exception, DiscoverSeriesModel>> discoverSeries();
  Future<Either<Exception, DiscoverMoviesModel>> discoverMovies();
}
