import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/genres_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContentRepository {
  Future<Either<Exception, GenresEntity>> getMovieGenres();
  Future<Either<Exception, GenresEntity>> getSeriesGenres();
  Future<Either<Exception, DetailsEntity>> getDetails();
}
