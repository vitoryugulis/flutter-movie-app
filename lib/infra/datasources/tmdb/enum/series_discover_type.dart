enum SeriesDiscoverType {
  airingToday('airing_today'),
  onTheAir('on_the_air'),
  popular('popular'),
  topRated('top_rated');

  const SeriesDiscoverType(this.value);
  final String value;
}
