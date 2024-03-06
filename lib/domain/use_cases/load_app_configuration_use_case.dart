import 'package:flutter_movie_app/domain/entities/app_configuration_entity.dart';
import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/movies/movie_genres_entity.dart';
import 'package:flutter_movie_app/domain/entities/series/series_genres_entity.dart';
import 'package:flutter_movie_app/domain/repositories/content_repository.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract class LoadAppConfigurationUseCase {
  Future<Either<Exception, AppConfigurationEntity>> call();
}

@Singleton(as: LoadAppConfigurationUseCase)
class LoadAppConfigurationUseCaseImpl implements LoadAppConfigurationUseCase {
  final ContentRepository contentRepository;
  MovieGenresEntity? movieGenresEntity;
  SeriesGenresEntity? seriesGenresEntity;
  DetailsEntity? detailsEntity;

  LoadAppConfigurationUseCaseImpl(this.contentRepository);

  @override
  Future<Either<Exception, AppConfigurationEntity>> call() async {
    try {
      final results = await Future.wait(
        [
          contentRepository.getSeriesGenres(),
          contentRepository.getMovieGenres(),
          contentRepository.getDetails(),
        ],
      );
      final hasAnyError = results.any((element) => element.isLeft());
      if (hasAnyError) {
        return Left(Exception('failed to load configurations'));
      }
      final appConfiguration = AppConfigurationEntity(
        details: getIt.get<DetailsEntity>(),
        movieGenres: getIt.get<MovieGenresEntity>(),
        seriesGenres: getIt.get<SeriesGenresEntity>(),
      );
      return Right(appConfiguration);
    } catch (e) {
      return Left(Exception('Unexpected error loading configurations'));
    }
  }
}
