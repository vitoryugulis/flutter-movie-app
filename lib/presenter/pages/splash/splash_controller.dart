import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/domain/entities/app_configuration_entity.dart';
import 'package:flutter_movie_app/domain/use_cases/load_app_configuration_use_case.dart';
import 'package:flutter_movie_app/presenter/pages/movies/movies_page.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:flutter_movie_app/presenter/utils/navigation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
class SplashController extends ChangeNotifier {
  final LoadAppConfigurationUseCase _loadAppConfigurationUseCase;
  final Navigation _navigation;
  AppState appState = LoadingState();

  SplashController(this._loadAppConfigurationUseCase, this._navigation);

  Future<Either<Exception, AppConfigurationEntity>> loadConfiguration() async {
    final result = await _loadAppConfigurationUseCase();
    return await result.fold((failure) {
      appState = FailureState();
      notifyListeners();
      return Left(failure);
    }, (configuration) async {
      GetIt.instance.registerSingleton<AppConfigurationEntity>(configuration);
      await Future.delayed(const Duration(seconds: 1));
      _navigation.go(MoviesPage.route);
      return Right(configuration);
    });
  }
}
