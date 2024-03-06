import 'package:flutter_movie_app/infra/models/discover_model.dart';

abstract class LocalStorageDatasource {
  Future<void> saveFavorite(ResultModel favorite);
  List<ResultModel> retrieveFavorites();
  Future<void> removeFavorite(int id);
}
