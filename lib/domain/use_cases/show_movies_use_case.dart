import 'package:flutter_movie_app/domain/entities/movies/discover_movies_entity.dart';
import 'package:flutter_movie_app/domain/repositories/content_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract class ShowMoviesUseCase {
  Future<Either<Exception, DiscoverMoviesEntity>> call();
}

@Singleton(as: ShowMoviesUseCase)
class ShowMoviesUseCaseImpl extends ShowMoviesUseCase {
  final ContentRepository _contentRepository;

  ShowMoviesUseCaseImpl(this._contentRepository);

  @override
  Future<Either<Exception, DiscoverMoviesEntity>> call() async {
    return await _contentRepository.getMovies();
  }
}
