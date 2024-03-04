import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/movie_genres_entity.dart';
import 'package:flutter_movie_app/domain/entities/series_genres_entity.dart';
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
      (success) {
        getIt.registerSingleton<DetailsEntity>(success);
        return Right(success);
      },
    );
  }

  @override
  Future<Either<Exception, MovieGenresEntity>> getMovieGenres() async {
    final result = await datasource.getMovieGenres();
    return result.fold(
      (error) => Left(error),
      (success) {
        getIt.registerSingleton<MovieGenresEntity>(success);
        return Right(success);
      },
    );
  }

  @override
  Future<Either<Exception, SeriesGenresEntity>> getSeriesGenres() async {
    final result = await datasource.getSeriesGenres();
    return result.fold(
      (error) => Left(error),
      (success) {
        getIt.registerSingleton<SeriesGenresEntity>(success);
        return Right(success);
      },
    );
  }
}
