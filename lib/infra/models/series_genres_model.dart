import 'package:flutter_movie_app/domain/entities/series/series_genres_entity.dart';

class SeriesGenresModel extends SeriesGenresEntity {
  SeriesGenresModel({
    required super.genres,
  });

  SeriesGenresModel.fromJson(Map<String, dynamic> json)
      : super(
          genres: List.from(json['genres'])
              .map((genre) => ItemModel.fromJson(genre))
              .toList(),
        );

  SeriesGenresEntity toEntity() {
    return SeriesGenresEntity(genres: genres);
  }
}

class ItemModel extends ItemEntity {
  ItemModel({
    required super.id,
    required super.name,
  });

  ItemModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          name: json['name'],
        );
}
