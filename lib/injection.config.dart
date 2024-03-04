// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/repositories/content_repository.dart' as _i5;
import 'domain/use_cases/load_app_configuration_use_case.dart' as _i7;
import 'infra/datasources/content_datasource.dart' as _i3;
import 'infra/datasources/tmdb/tmdb_datasource.dart' as _i4;
import 'infra/repositories/content_repository_impl.dart' as _i6;
import 'presenter/pages/splash/splash_controller.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ContentDatasource>(_i4.TMDBDatasource());
    gh.singleton<_i5.ContentRepository>(
        _i6.ContentRepositoryImpl(gh<_i3.ContentDatasource>()));
    gh.singleton<_i7.LoadAppConfigurationUseCase>(
        _i7.LoadAppConfigurationUseCaseImpl(gh<_i5.ContentRepository>()));
    gh.singleton<_i8.SplashController>(
        _i8.SplashController(gh<_i7.LoadAppConfigurationUseCase>()));
    return this;
  }
}
