import 'package:flutter/material.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/pages/home/home_controller.dart';
import 'package:flutter_movie_app/presenter/utils/styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = getIt.get<HomeController>();
  final String moviesLottie = 'assets/lottie/movies.json';
  final String tvSeriesLottie = 'assets/lottie/tvseries.json';
  final String favorites = 'assets/lottie/heart.json';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0XFF0d253f),
        body: ChangeNotifierProvider(
            create: (context) => homeController,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        'Filmes',
                        style: Styles.mdText,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => homeController.toMoviesPage(),
                        child: Lottie.asset(
                          moviesLottie,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Séries',
                        style: Styles.mdText,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => homeController.toSeriesPage(),
                        child: Lottie.asset(
                          tvSeriesLottie,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Meus favoritos',
                        style: Styles.mdText,
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => homeController.toFavoritesPage(),
                        child: Lottie.asset(
                          favorites,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
