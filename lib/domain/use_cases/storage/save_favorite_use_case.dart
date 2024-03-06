import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:flutter_movie_app/domain/repositories/local_storage_repository.dart';
import 'package:injectable/injectable.dart';

abstract class SaveFavoriteUseCase {
  Future<void> call(ResultEntity favorite);
}

@Singleton(as: SaveFavoriteUseCase)
class SaveFavoriteUseCaseImpl extends SaveFavoriteUseCase {
  final LocalStorageRepository _localStorageRepository;

  SaveFavoriteUseCaseImpl(this._localStorageRepository);

  @override
  Future<void> call(ResultEntity favorite) async {
    return await _localStorageRepository.saveFavorite(favorite);
  }
}
