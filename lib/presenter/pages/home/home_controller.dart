import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presenter/pages/favorites/favorites_page.dart';
import 'package:flutter_movie_app/presenter/pages/movies/movies_page.dart';
import 'package:flutter_movie_app/presenter/pages/series/series_page.dart';
import 'package:flutter_movie_app/presenter/utils/navigation.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeController extends ChangeNotifier {
  final Navigation _navigation;
  HomeController(this._navigation);

  void toSeriesPage() => _navigation.go(SeriesPage.route);
  void toMoviesPage() => _navigation.go(MoviesPage.route);
  void toFavoritesPage() => _navigation.go(FavoritesPage.route);
}
