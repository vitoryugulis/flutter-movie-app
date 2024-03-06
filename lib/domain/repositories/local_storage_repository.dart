import 'package:flutter_movie_app/domain/entities/discover_entity.dart';

abstract class LocalStorageRepository {
  Future<void> saveFavorite(ResultEntity favorite);
  List<ResultEntity> retrieveFavorites();
  Future<void> removeFavorite(int id);
}
