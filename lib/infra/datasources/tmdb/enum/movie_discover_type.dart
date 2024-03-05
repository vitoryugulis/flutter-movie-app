enum MovieDiscoverType {
  nowPlaying('airing_today'),
  popular('airing_today'),
  topRated('airing_today'),
  upComing('airing_today');

  const MovieDiscoverType(this.value);
  final String value;
}
