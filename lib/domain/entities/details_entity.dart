class DetailsEntity {
  DetailsEntity({
    required this.images,
    required this.changeKeys,
  });
  late final Images images;
  late final List<String> changeKeys;
}

class Images {
  Images({
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
}
