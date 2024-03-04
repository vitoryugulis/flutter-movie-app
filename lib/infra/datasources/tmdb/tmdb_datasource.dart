import 'dart:convert';
import 'dart:io';

import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/movie_genres_entity.dart';
import 'package:flutter_movie_app/domain/entities/series_genres_entity.dart';
import 'package:flutter_movie_app/infra/datasources/content_datasource.dart';
import 'package:flutter_movie_app/infra/models/details_model.dart';
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
  Future<Either<Exception, DetailsEntity>> getConfiguration() async {
    const path = '3/configuration';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer $token'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getConfiguration request error'));
      }
      final model = DetailsModel.fromJson(jsonDecode(result.body));
      return Right(model.toEntity());
    } catch (e) {
      return Left(Exception('getConfiguration unexpected error'));
    }
  }

  @override
  Future<Either<Exception, MovieGenresEntity>> getMovieGenres() async {
    const path = '3/genre/movie/list';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer $token'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getMovieGenres request error'));
      }
      final model = MovieGenresModel.fromJson(jsonDecode(result.body));
      return Right(model.toEntity());
    } catch (e) {
      return Left(Exception('getMovieGenres unexpected error'));
    }
  }

  @override
  Future<Either<Exception, SeriesGenresEntity>> getSeriesGenres() async {
    const path = '3/genre/tv/list';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer $token'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getSeriesGenres request error'));
      }
      final model = SeriesGenresModel.fromJson(jsonDecode(result.body));
      return Right(model.toEntity());
    } catch (e) {
      return Left(Exception('getSeriesGenres unexpected error'));
    }
  }
}
