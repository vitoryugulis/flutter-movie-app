enum MovieDiscoverType {
  nowPlaying('now_playing'),
  popular('popular'),
  topRated('top_rated'),
  upComing('upcoming');

  const MovieDiscoverType(this.value);
  final String value;
}
