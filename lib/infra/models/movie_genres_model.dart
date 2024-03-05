import 'package:flutter_movie_app/domain/entities/movie_genres_entity.dart';

class MovieGenresModel extends MovieGenresEntity {
  MovieGenresModel({
    required super.genres,
  });

  MovieGenresModel.fromJson(Map<String, dynamic> json)
      : super(
            genres: List.from(json['genres'])
                .map((genre) => ItemModel.fromJson(genre))
                .toList());

  MovieGenresEntity toEntity() {
    return MovieGenresEntity(
        genres: genres.map((e) => ItemEntity(id: e.id, name: e.name)).toList());
  }
}

class ItemModel extends ItemEntity {
  ItemModel({
    required super.id,
    required super.name,
  });

  ItemModel.fromJson(Map<String, dynamic> json)
      : super(id: json['id'], name: json['name']);
}
