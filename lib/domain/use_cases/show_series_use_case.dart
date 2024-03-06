import 'package:flutter_movie_app/domain/entities/series/discover_series_entity.dart';
import 'package:flutter_movie_app/domain/repositories/content_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract class ShowSeriesUseCase {
  Future<Either<Exception, DiscoverSeriesEntity>> call();
}

@Singleton(as: ShowSeriesUseCase)
class ShowSeriesUseCaseCaseImpl extends ShowSeriesUseCase {
  final ContentRepository _contentRepository;

  ShowSeriesUseCaseCaseImpl(this._contentRepository);

  @override
  Future<Either<Exception, DiscoverSeriesEntity>> call() async {
    return await _contentRepository.getSeries();
  }
}
