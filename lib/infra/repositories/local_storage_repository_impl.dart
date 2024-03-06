import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:flutter_movie_app/domain/repositories/local_storage_repository.dart';
import 'package:flutter_movie_app/infra/datasources/local_storage_datasource.dart';
import 'package:flutter_movie_app/infra/models/discover_model.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LocalStorageRepository)
class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;
  LocalStorageRepositoryImpl(this.datasource);
  @override
  Future<void> removeFavorite(int id) {
    return datasource.removeFavorite(id);
  }

  @override
  List<ResultEntity> retrieveFavorites() {
    return datasource.retrieveFavorites();
  }

  @override
  Future<void> saveFavorite(ResultEntity favorite) {
    final model = ResultModel.fromResultEntity(favorite);
    return datasource.saveFavorite(model);
  }
}
