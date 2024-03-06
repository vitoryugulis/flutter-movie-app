import 'package:flutter_movie_app/domain/entities/details_entity.dart';

class DetailsModel extends DetailsEntity {
  DetailsModel({
    required super.images,
    required super.changeKeys,
  });

  DetailsModel.fromJson(Map<String, dynamic> json)
      : super(
          images: ImagesModel.fromJson(json['images']),
          changeKeys: List<String>.from(json['change_keys'] ?? []),
        );

  DetailsEntity toEntity() {
    return DetailsEntity(images: images, changeKeys: changeKeys);
  }
}

class ImagesModel extends ImagesEntity {
  ImagesModel({
    required super.baseUrl,
    required super.secureBaseUrl,
    required super.backdropSizes,
    required super.logoSizes,
    required super.posterSizes,
    required super.profileSizes,
    required super.stillSizes,
  });

  ImagesModel.fromJson(Map<String, dynamic> json)
      : super(
          baseUrl: json['base_url'] ?? '',
          secureBaseUrl: json['secure_base_url'] ?? '',
          backdropSizes: List<String>.from(json['backdrop_sizes'] ?? []),
          logoSizes: List<String>.from(json['logo_sizes'] ?? []),
          posterSizes: List<String>.from(json['poster_sizes'] ?? []),
          profileSizes: List<String>.from(json['profile_sizes'] ?? []),
          stillSizes: List<String>.from(json['still_sizes'] ?? []),
        );
}
