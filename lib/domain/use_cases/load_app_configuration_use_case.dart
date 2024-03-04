import 'package:flutter_movie_app/domain/repositories/content_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoadAppConfigurationUseCase {
  Future<Either<Exception, Object>> call();
}

class LoadAppConfigurationUseCaseImpl implements LoadAppConfigurationUseCase {
  final ContentRepository contentRepository;

  LoadAppConfigurationUseCaseImpl(this.contentRepository);

  @override
  Future<Either<Exception, Object>> call() async {
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
    return Right(results);
  }
}
