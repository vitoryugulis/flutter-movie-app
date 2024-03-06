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
import 'domain/use_cases/favorites/remove_favorite_use_case.dart' as _i13;
import 'domain/use_cases/favorites/retrieve_favorites_use_case.dart' as _i14;
import 'domain/use_cases/favorites/save_favorite_use_case.dart' as _i15;
import 'domain/use_cases/load_app_configuration_use_case.dart' as _i7;
import 'domain/use_cases/show_movies_use_case.dart' as _i16;
import 'domain/use_cases/show_series_use_case.dart' as _i17;
import 'infra/datasources/content_datasource.dart' as _i3;
import 'infra/datasources/local_storage/hive_datasource.dart' as _i9;
import 'infra/datasources/local_storage_datasource.dart' as _i8;
import 'infra/datasources/tmdb/tmdb_datasource.dart' as _i4;
import 'infra/repositories/content_repository_impl.dart' as _i6;
import 'infra/repositories/local_storage_repository_impl.dart' as _i11;
import 'presenter/pages/favorites/favorites_controller.dart' as _i19;
import 'presenter/pages/home/home_controller.dart' as _i20;
import 'presenter/pages/movies/movies_controller.dart' as _i21;
import 'presenter/pages/series/series_controller.dart' as _i22;
import 'presenter/pages/splash/splash_controller.dart' as _i18;
import 'presenter/utils/navigation.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
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
    await gh.factoryAsync<_i8.LocalStorageDatasource>(
      () => _i9.HiveDatasource.create(),
      preResolve: true,
    );
    gh.singleton<_i10.LocalStorageRepository>(
        _i11.LocalStorageRepositoryImpl(gh<_i8.LocalStorageDatasource>()));
    gh.singleton<_i12.Navigation>(_i12.Navigation());
    gh.singleton<_i13.RemoveFavoriteUseCase>(
        _i13.RemoveFavoriteUseCaseImpl(gh<_i10.LocalStorageRepository>()));
    gh.singleton<_i14.RetrieveFavoritesUseCase>(
        _i14.RetrieveFavoritesUseCaseImpl(gh<_i10.LocalStorageRepository>()));
    gh.singleton<_i15.SaveFavoriteUseCase>(
        _i15.SaveFavoriteUseCaseImpl(gh<_i10.LocalStorageRepository>()));
    gh.singleton<_i16.ShowMoviesUseCase>(
        _i16.ShowMoviesUseCaseImpl(gh<_i5.ContentRepository>()));
    gh.singleton<_i17.ShowSeriesUseCase>(
        _i17.ShowSeriesUseCaseCaseImpl(gh<_i5.ContentRepository>()));
    gh.singleton<_i18.SplashController>(_i18.SplashController(
      gh<_i7.LoadAppConfigurationUseCase>(),
      gh<_i12.Navigation>(),
    ));
    gh.factory<_i19.FavoritesController>(() => _i19.FavoritesController(
          gh<_i14.RetrieveFavoritesUseCase>(),
          gh<_i13.RemoveFavoriteUseCase>(),
        ));
    gh.factory<_i20.HomeController>(
        () => _i20.HomeController(gh<_i12.Navigation>()));
    gh.factory<_i21.MoviesController>(() => _i21.MoviesController(
          gh<_i16.ShowMoviesUseCase>(),
          gh<_i15.SaveFavoriteUseCase>(),
        ));
    gh.factory<_i22.SeriesController>(() => _i22.SeriesController(
          gh<_i17.ShowSeriesUseCase>(),
          gh<_i15.SaveFavoriteUseCase>(),
        ));
    return this;
  }
}
