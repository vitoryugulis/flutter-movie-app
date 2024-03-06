import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:flutter_movie_app/domain/entities/series/discover_series_entity.dart';
import 'package:flutter_movie_app/domain/use_cases/favorites/save_favorite_use_case.dart';
import 'package:flutter_movie_app/domain/use_cases/show_series_use_case.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class SeriesController extends ChangeNotifier {
  final ShowSeriesUseCase _showSeriesUseCase;
  final SaveFavoriteUseCase _saveFavoriteUseCase;
  AppState appState = LoadingState();
  late DiscoverSeriesEntity seriesList;

  SeriesController(this._showSeriesUseCase, this._saveFavoriteUseCase);

  Future<void> saveFavorite(ResultEntity favorite) =>
      _saveFavoriteUseCase(favorite);

  Future<Either<Exception, DiscoverSeriesEntity>> getMovies() async {
    final result = await _showSeriesUseCase();
    return result.fold(
      (failure) {
        appState = FailureState();
        notifyListeners();
        return Left(failure);
      },
      (success) {
        seriesList = success;
        appState = SuccessState();
        notifyListeners();
        return Right(success);
      },
    );
  }
}
