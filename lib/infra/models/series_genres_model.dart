import 'package:flutter_movie_app/domain/entities/series_genres_entity.dart';

class SeriesGenresModel {
  SeriesGenresModel({
    required this.genres,
  });
  late final List<ItemModel> genres;

  SeriesGenresModel.fromJson(Map<String, dynamic> json) {
    genres = List.from(json['genres'])
        .map((genre) => ItemModel.fromJson(genre))
        .toList();
  }

  SeriesGenresEntity toEntity() {
    return SeriesGenresEntity(
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
