import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/domain/entities/app_configuration_entity.dart';
import 'package:flutter_movie_app/domain/use_cases/load_app_configuration_use_case.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
class SplashController extends ChangeNotifier {
  final LoadAppConfigurationUseCase _loadAppConfigurationUseCase;
  AppState appState = LoadingState();

  SplashController(this._loadAppConfigurationUseCase);

  void loadConfiguration() async {
    final result = await _loadAppConfigurationUseCase();
    await result.fold((failure) {
      appState = FailureState();
      notifyListeners();
    }, (configuration) async {
      GetIt.instance.registerSingleton<AppConfigurationEntity>(configuration);
      await Future.delayed(const Duration(seconds: 5));
      appState = SuccessState();
      notifyListeners();
    });
  }
}
