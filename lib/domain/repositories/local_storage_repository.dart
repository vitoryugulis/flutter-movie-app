import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class LocalStorageRepository {
  Future<void> saveFavorite(ResultEntity favorite);
  Either<Exception, List<ResultEntity>> retrieveFavorites();
  Future<void> removeFavorite(int id);
}
