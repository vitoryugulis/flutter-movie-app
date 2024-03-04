import 'package:flutter_movie_app/domain/entities/movie_genres_entity.dart';

class MovieGenresModel {
  MovieGenresModel({
    required this.genres,
  });
  late final List<ItemModel> genres;

  MovieGenresModel.fromJson(Map<String, dynamic> json) {
    genres = List.from(json['genres'])
        .map((genre) => ItemModel.fromJson(genre))
        .toList();
  }

  MovieGenresEntity toEntity() {
    return MovieGenresEntity(
        genres: genres.map((e) => ItemEntity(id: e.id, name: e.name)).toList());
  }
}

class ItemModel {
  ItemModel({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
