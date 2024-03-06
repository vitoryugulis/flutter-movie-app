import 'dart:convert';
import 'dart:io';
import 'package:flutter_movie_app/infra/datasources/content_datasource.dart';
import 'package:flutter_movie_app/infra/datasources/tmdb/enum/movie_discover_type.dart';
import 'package:flutter_movie_app/infra/datasources/tmdb/enum/series_discover_type.dart';
import 'package:flutter_movie_app/infra/models/details_model.dart';
import 'package:flutter_movie_app/infra/models/discover_model.dart';
import 'package:flutter_movie_app/infra/models/discover_movies_model.dart';
import 'package:flutter_movie_app/infra/models/discover_series_model.dart';
import 'package:flutter_movie_app/infra/models/movie_genres_model.dart';
import 'package:flutter_movie_app/infra/models/series_genres_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ContentDatasource)
class TMDBDatasource implements ContentDatasource {
  @lazySingleton
  http.Client get client => http.Client();
  final url = 'api.themoviedb.org';
  final token = dotenv.env['BEARER_TOKEN'];

  @override
  Future<Either<Exception, DetailsModel>> getConfiguration() async {
    const path = '3/configuration';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer $token'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getConfiguration request error'));
      }
      final model = DetailsModel.fromJson(jsonDecode(result.body));
      return Right(model);
    } catch (e) {
      return Left(Exception('getConfiguration unexpected error'));
    }
  }

  @override
  Future<Either<Exception, MovieGenresModel>> getMovieGenres() async {
    const path = '3/genre/movie/list';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer $token'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getMovieGenres request error'));
      }
      final model = MovieGenresModel.fromJson(jsonDecode(result.body));
      return Right(model);
    } catch (e) {
      return Left(Exception('getMovieGenres unexpected error'));
    }
  }

  @override
  Future<Either<Exception, SeriesGenresModel>> getSeriesGenres() async {
    const path = '3/genre/tv/list';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer $token'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getSeriesGenres request error'));
      }
      final model = SeriesGenresModel.fromJson(jsonDecode(result.body));
      return Right(model);
    } catch (e) {
      return Left(Exception('getSeriesGenres unexpected error'));
    }
  }

  @override
  Future<Either<Exception, DiscoverMoviesModel>> discoverMovies() async {
    final headers = {'Authorization': 'Bearer $token'};
    final queryParams = {'language': 'pt', 'page': '1'};
    final nowPlaying = '3/movie/${MovieDiscoverType.nowPlaying.value}';
    final popular = '3/movie/${MovieDiscoverType.popular.value}';
    final topRated = '3/movie/${MovieDiscoverType.topRated.value}';
    final upComing = '3/movie/${MovieDiscoverType.upComing.value}';

    try {
      final results = await Future.wait([
        client.get(Uri.https(url, nowPlaying, queryParams), headers: headers),
        client.get(Uri.https(url, popular, queryParams), headers: headers),
        client.get(Uri.https(url, topRated, queryParams), headers: headers),
        client.get(Uri.https(url, upComing, queryParams), headers: headers),
      ]);
      final hasAnyFailures =
          results.any((result) => result.statusCode != HttpStatus.ok);
      if (hasAnyFailures) {
        return Left(Exception('discoverMovies request error'));
      }

      final discover = DiscoverMoviesModel(
        nowPlaying: DiscoverModel.fromJson(jsonDecode(results[0].body)),
        popular: DiscoverModel.fromJson(jsonDecode(results[1].body)),
        topRated: DiscoverModel.fromJson(jsonDecode(results[2].body)),
        upComing: DiscoverModel.fromJson(jsonDecode(results[3].body)),
      );

      return Right(discover);
    } catch (e) {
      return Left(Exception('discoverMovies unexpected error'));
    }
  }

  @override
  Future<Either<Exception, DiscoverSeriesModel>> discoverSeries() async {
    final headers = {'Authorization': 'Bearer $token'};
    final queryParams = {'language': 'pt', 'page': '1'};
    final topRated = '3/tv/${SeriesDiscoverType.topRated.value}';
    final airingToday = '3/tv/${SeriesDiscoverType.airingToday.value}';
    final onTheAir = '3/tv/${SeriesDiscoverType.onTheAir.value}';
    final popular = '3/tv/${SeriesDiscoverType.popular.value}';

    try {
      final results = await Future.wait([
        client.get(Uri.https(url, topRated, queryParams), headers: headers),
        client.get(Uri.https(url, airingToday, queryParams), headers: headers),
        client.get(Uri.https(url, onTheAir, queryParams), headers: headers),
        client.get(Uri.https(url, popular, queryParams), headers: headers),
      ]);
      final hasAnyFailures =
          results.any((result) => result.statusCode != HttpStatus.ok);
      if (hasAnyFailures) {
        return Left(Exception('discoverSeries request error'));
      }

      final discover = DiscoverSeriesModel(
        topRated: DiscoverModel.fromJson(jsonDecode(results[0].body)),
        airingToday: DiscoverModel.fromJson(jsonDecode(results[1].body)),
        onTheAir: DiscoverModel.fromJson(jsonDecode(results[2].body)),
        popular: DiscoverModel.fromJson(jsonDecode(results[3].body)),
      );

      return Right(discover);
    } catch (e) {
      return Left(Exception('discoverSeries unexpected error'));
    }
  }
}
