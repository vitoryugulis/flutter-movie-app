import 'package:flutter_movie_app/infra/datasources/local_storage_datasource.dart';
import 'package:flutter_movie_app/infra/models/discover_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@Injectable(as: LocalStorageDatasource)
class HiveDatasource extends LocalStorageDatasource {
  Box hiveBox;
  HiveDatasource(this.hiveBox);

  @FactoryMethod(preResolve: true)
  static Future<HiveDatasource> create() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    final hiveBox = await Hive.openBox('favorites');
    return Future.value(HiveDatasource(hiveBox));
  }

  @override
  Future<void> removeFavorite(int id) async {
    return await hiveBox.delete(id);
  }

  @override
  Either<Exception, List<ResultModel>> retrieveFavorites() {
    try {
      final favorites =
          hiveBox.values.map((e) => ResultModel.fromJson(e)).toList();
      return Right(favorites);
    } catch (e) {
      return Left(Exception('failed to retrieve favorites'));
    }
  }

  @override
  Future<void> saveFavorite(ResultModel favorite) async {
    return await hiveBox.put(favorite.id, favorite.toMap());
  }
}
