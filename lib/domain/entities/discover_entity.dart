class DiscoverEntity {
  DiscoverEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  int page;
  List<ResultEntity> results;
  int totalPages;
  int totalResults;
}

class ResultEntity {
  ResultEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.firstAirDate,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String firstAirDate;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  String get posterFullPath => 'https://image.tmdb.org/t/p/w500/$posterPath';
  String get backdropFullPath => 'https://image.tmdb.org/t/p/w780/$backdropPath';
}
