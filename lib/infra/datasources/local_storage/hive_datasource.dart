import 'package:flutter_movie_app/infra/datasources/local_storage_datasource.dart';
import 'package:flutter_movie_app/infra/models/discover_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LocalStorageDatasource)
class HiveDatasource extends LocalStorageDatasource {
  @lazySingleton
  Box get hiveBox => Hive.box('favorites');
  @override
  Future<void> removeFavorite(int id) async {
    return await hiveBox.delete(id);
  }

  @override
  List<ResultModel> retrieveFavorites() {
    return hiveBox.values.map((e) => ResultModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveFavorite(ResultModel favorite) async {
    return await hiveBox.put(favorite.id, favorite.toMap());
  }
}
