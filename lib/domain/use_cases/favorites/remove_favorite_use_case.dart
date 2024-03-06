import 'package:flutter_movie_app/domain/repositories/local_storage_repository.dart';
import 'package:injectable/injectable.dart';

abstract class RemoveFavoriteUseCase {
  Future<void> call(int id);
}

@Singleton(as: RemoveFavoriteUseCase)
class RemoveFavoriteUseCaseImpl extends RemoveFavoriteUseCase {
  final LocalStorageRepository _localStorageRepository;

  RemoveFavoriteUseCaseImpl(this._localStorageRepository);

  @override
  Future<void> call(int id) async {
    return _localStorageRepository.removeFavorite(id);
  }
}
