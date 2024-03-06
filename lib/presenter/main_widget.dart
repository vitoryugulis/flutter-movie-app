import 'package:flutter/material.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/pages/favorites/favorites_page.dart';
import 'package:flutter_movie_app/presenter/pages/home/home_page.dart';
import 'package:flutter_movie_app/presenter/pages/movies/movies_page.dart';
import 'package:flutter_movie_app/presenter/pages/series/series_page.dart';
import 'package:flutter_movie_app/presenter/pages/splash/splash_page.dart';
import 'package:flutter_movie_app/presenter/utils/navigation.dart';

class FlutterMovieApp extends StatelessWidget {
  const FlutterMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<Navigation>().navigatorKey,
      title: 'A Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route: (context) => const SplashPage(),
        HomePage.route: (context) => const HomePage(),
        MoviesPage.route: (context) => const MoviesPage(),
        SeriesPage.route: (context) => const SeriesPage(),
        FavoritesPage.route: (context) => const FavoritesPage(),
      },
    );
  }
}
