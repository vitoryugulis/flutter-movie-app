import 'package:flutter_movie_app/domain/entities/details_entity.dart';

class DetailsModel {
  DetailsModel({
    required this.images,
    required this.changeKeys,
  });
  late final ImagesModel images;
  late final List<String> changeKeys;

  DetailsModel.fromJson(Map<String, dynamic> json) {
    images = ImagesModel.fromJson(json['images']);
    changeKeys = List.castFrom<dynamic, String>(json['change_keys']);
  }

  DetailsEntity toEntity() {
    return DetailsEntity(
      changeKeys: changeKeys,
      images: Images(
        backdropSizes: images.backdropSizes,
        baseUrl: images.baseUrl,
        logoSizes: images.logoSizes,
        posterSizes: images.posterSizes,
        profileSizes: images.profileSizes,
        secureBaseUrl: images.secureBaseUrl,
        stillSizes: images.stillSizes,
      ),
    );
  }
}

class ImagesModel {
  ImagesModel({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });
  late final String baseUrl;
  late final String secureBaseUrl;
  late final List<String> backdropSizes;
  late final List<String> logoSizes;
  late final List<String> posterSizes;
  late final List<String> profileSizes;
  late final List<String> stillSizes;

  ImagesModel.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    secureBaseUrl = json['secure_base_url'];
    backdropSizes = List.castFrom<dynamic, String>(json['backdrop_sizes']);
    logoSizes = List.castFrom<dynamic, String>(json['logo_sizes']);
    posterSizes = List.castFrom<dynamic, String>(json['poster_sizes']);
    profileSizes = List.castFrom<dynamic, String>(json['profile_sizes']);
    stillSizes = List.castFrom<dynamic, String>(json['still_sizes']);
  }
}
