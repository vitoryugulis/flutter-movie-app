import 'package:flutter_movie_app/infra/models/discover_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class LocalStorageDatasource {
  Future<void> saveFavorite(ResultModel favorite);
  Either<Exception, List<ResultModel>> retrieveFavorites();
  Future<void> removeFavorite(int id);
}
