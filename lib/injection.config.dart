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
import 'domain/repositories/local_storage_repository.dart' as _i10;
import 'domain/use_cases/load_app_configuration_use_case.dart' as _i7;
import 'domain/use_cases/show_movies_use_case.dart' as _i13;
import 'domain/use_cases/show_series_use_case.dart' as _i14;
import 'infra/datasources/content_datasource.dart' as _i3;
import 'infra/datasources/local_storage/hive_datasource.dart' as _i9;
import 'infra/datasources/local_storage_datasource.dart' as _i8;
import 'infra/datasources/tmdb/tmdb_datasource.dart' as _i4;
import 'infra/repositories/content_repository_impl.dart' as _i6;
import 'infra/repositories/local_storage_repository_impl.dart' as _i11;
import 'presenter/pages/home/home_controller.dart' as _i16;
import 'presenter/pages/movies/movies_controller.dart' as _i17;
import 'presenter/pages/series/series_controller.dart' as _i18;
import 'presenter/pages/splash/splash_controller.dart' as _i15;
import 'presenter/utils/navigation.dart' as _i12;

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
    gh.singleton<_i8.LocalStorageDatasource>(_i9.HiveDatasource());
    gh.singleton<_i10.LocalStorageRepository>(
        _i11.LocalStorageRepositoryImpl(gh<_i8.LocalStorageDatasource>()));
    gh.singleton<_i12.Navigation>(_i12.Navigation());
    gh.singleton<_i13.ShowMoviesUseCase>(
        _i13.ShowMoviesUseCaseImpl(gh<_i5.ContentRepository>()));
    gh.singleton<_i14.ShowSeriesUseCase>(
        _i14.ShowSeriesUseCaseCaseImpl(gh<_i5.ContentRepository>()));
    gh.singleton<_i15.SplashController>(_i15.SplashController(
      gh<_i7.LoadAppConfigurationUseCase>(),
      gh<_i12.Navigation>(),
    ));
    gh.factory<_i16.HomeController>(
        () => _i16.HomeController(gh<_i12.Navigation>()));
    gh.factory<_i17.MoviesController>(
        () => _i17.MoviesController(gh<_i13.ShowMoviesUseCase>()));
    gh.factory<_i18.SeriesController>(
        () => _i18.SeriesController(gh<_i14.ShowSeriesUseCase>()));
    return this;
  }
}
