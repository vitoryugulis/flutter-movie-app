import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:flutter_movie_app/domain/repositories/local_storage_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract class RetrieveFavoritesUseCase {
  Either<Exception, List<ResultEntity>> call();
}

@Singleton(as: RetrieveFavoritesUseCase)
class RetrieveFavoritesUseCaseImpl extends RetrieveFavoritesUseCase {
  final LocalStorageRepository _localStorageRepository;

  RetrieveFavoritesUseCaseImpl(this._localStorageRepository);

  @override
  Either<Exception, List<ResultEntity>> call() {
    return _localStorageRepository.retrieveFavorites();
  }
}
