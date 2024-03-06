import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:flutter_movie_app/domain/use_cases/favorites/remove_favorite_use_case.dart';
import 'package:flutter_movie_app/domain/use_cases/favorites/retrieve_favorites_use_case.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoritesController extends ChangeNotifier {
  final RetrieveFavoritesUseCase _retrieveFavoritesUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;

  AppState appState = LoadingState();
  late List<ResultEntity> favorites;
  FavoritesController(
      this._retrieveFavoritesUseCase, this._removeFavoriteUseCase);

  Future<void> removeFavorite(int id) async {
    final result = await _removeFavoriteUseCase(id);
    notifyListeners();
    return result;
  }

  Either<Exception, List<ResultEntity>> retrieveFavorites() {
    return _retrieveFavoritesUseCase().fold(
      (failure) {
        appState = FailureState();
        notifyListeners();
        return Left(failure);
      },
      (success) {
        favorites = success;
        appState = SuccessState();
        notifyListeners();
        return Right(success);
      },
    );
  }
}
