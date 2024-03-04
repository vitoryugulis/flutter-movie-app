import 'dart:convert';
import 'dart:io';

import 'package:flutter_movie_app/domain/entities/details_entity.dart';
import 'package:flutter_movie_app/domain/entities/genres_entity.dart';
import 'package:flutter_movie_app/infra/datasources/content_datasource.dart';
import 'package:flutter_movie_app/infra/models/details_model.dart';
import 'package:flutter_movie_app/infra/models/genres_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TMDBDatasource implements ContentDatasource {
  final http.Client client;
  final url = 'https://api.themoviedb.org/3/';
  final token = dotenv.env['BEARER_TOKEN'];

  TMDBDatasource(this.client);

  @override
  Future<Either<Exception, DetailsEntity>> getConfiguration() async {
    const path = 'configuration';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer'});
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
  Future<Either<Exception, GenresEntity>> getMovieGenres() async {
    const path = 'genre/movie/list';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getMovieGenres request error'));
      }
      final model = GenresModel.fromJson(jsonDecode(result.body));
      return Right(model.toEntity());
    } catch (e) {
      return Left(Exception('getMovieGenres unexpected error'));
    }
  }

  @override
  Future<Either<Exception, GenresEntity>> getSeriesGenres() async {
    const path = 'genre/tv/list';
    try {
      final result = await client.get(Uri.https(url, path, {'language': 'pt'}),
          headers: {'Authorization': 'Bearer'});
      if (result.statusCode != HttpStatus.ok) {
        return Left(Exception('getSeriesGenres request error'));
      }
      final model = GenresModel.fromJson(jsonDecode(result.body));
      return Right(model.toEntity());
    } catch (e) {
      return Left(Exception('getSeriesGenres unexpected error'));
    }
  }
}
