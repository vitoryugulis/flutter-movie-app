import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:flutter_movie_app/domain/repositories/local_storage_repository.dart';
import 'package:injectable/injectable.dart';

abstract class RetrieveFavoritesUseCase {
  List<ResultEntity> call();
}

@Singleton(as: RetrieveFavoritesUseCase)
class RetrieveFavoritesUseCaseImpl extends RetrieveFavoritesUseCase {
  final LocalStorageRepository _localStorageRepository;

  RetrieveFavoritesUseCaseImpl(this._localStorageRepository);

  @override
  List<ResultEntity> call() {
    return _localStorageRepository.retrieveFavorites();
  }
}
