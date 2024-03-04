import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/genres_entity.dart';
import 'package:flutter_movie_app/domain/repositories/content_repository.dart';
import 'package:flutter_movie_app/infra/datasources/content_datasource.dart';
import 'package:fpdart/fpdart.dart';

class ContentRepositoryImpl extends ContentRepository {
  final ContentDatasource datasource;

  ContentRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, DetailsEntity>> getDetails() async {
    final result = await datasource.getConfiguration();
    return result.fold(
      (error) => Left(error),
      (success) => result,
    );
  }

  @override
  Future<Either<Exception, GenresEntity>> getMovieGenres() async {
    final result = await datasource.getMovieGenres();
    return result.fold(
      (error) => Left(error),
      (success) => result,
    );
  }

  @override
  Future<Either<Exception, GenresEntity>> getSeriesGenres() async {
    final result = await datasource.getSeriesGenres();
    return result.fold(
      (error) => Left(error),
      (success) => result,
    );
  }
}
