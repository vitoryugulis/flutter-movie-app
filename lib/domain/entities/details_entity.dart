class DetailsEntity {
  DetailsEntity({
    required this.images,
    required this.changeKeys,
  });
   ImagesEntity images;
   List<String> changeKeys;
}

class ImagesEntity {
  ImagesEntity({
    required this.baseUrl,
    required this.secureBaseUrl,
    required this.backdropSizes,
    required this.logoSizes,
    required this.posterSizes,
    required this.profileSizes,
    required this.stillSizes,
  });
   String baseUrl;
   String secureBaseUrl;
   List<String> backdropSizes;
   List<String> logoSizes;
   List<String> posterSizes;
   List<String> profileSizes;
   List<String> stillSizes;
}
