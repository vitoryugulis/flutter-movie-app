import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/movies/discover_movies_entity.dart';
import 'package:flutter_movie_app/domain/entities/movies/movie_genres_entity.dart';
import 'package:flutter_movie_app/domain/entities/series/discover_series_entity.dart';
import 'package:flutter_movie_app/domain/entities/series/series_genres_entity.dart';
import 'package:flutter_movie_app/domain/repositories/content_repository.dart';
import 'package:flutter_movie_app/infra/datasources/content_datasource.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ContentRepository)
class ContentRepositoryImpl extends ContentRepository {
  final ContentDatasource datasource;

  ContentRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, DetailsEntity>> getDetails() async {
    final result = await datasource.getConfiguration();
    return result.fold(
      (error) => Left(error),
      (model) {
        final entity = model.toEntity();
        getIt.registerSingleton<DetailsEntity>(entity);
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Exception, MovieGenresEntity>> getMovieGenres() async {
    final result = await datasource.getMovieGenres();
    return result.fold(
      (error) => Left(error),
      (model) {
        final entity = model.toEntity();
        getIt.registerSingleton<MovieGenresEntity>(entity);
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Exception, SeriesGenresEntity>> getSeriesGenres() async {
    final result = await datasource.getSeriesGenres();
    return result.fold(
      (error) => Left(error),
      (model) {
        final entity = model.toEntity();
        getIt.registerSingleton<SeriesGenresEntity>(entity);
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Exception, DiscoverSeriesEntity>> getSeries() async {
    final result = await datasource.discoverSeries();
    return result.fold(
      (error) => Left(error),
      (model) {
        final entity = model;
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Exception, DiscoverMoviesEntity>> getMovies() async {
    final result = await datasource.discoverMovies();
    return result.fold(
      (error) => Left(error),
      (model) {
        final entity = model;
        return Right(entity);
      },
    );
  }
}
