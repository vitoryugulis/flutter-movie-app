import 'package:flutter/material.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/pages/movies/movies_controller.dart';
import 'package:flutter_movie_app/presenter/pages/movies/widgets/movies_carousel.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/failure_widget.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/loading_widget.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  static const route = '/movies';
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final moviesController = getIt.get<MoviesController>();

  @override
  void initState() {
    super.initState();
    moviesController.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0d253f),
      body: ChangeNotifierProvider(
        create: (context) => moviesController,
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
          child: Consumer<MoviesController>(
            builder: (context, controller, _) {
              if (controller.appState is LoadingState) {
                return const LoadingWidget();
              }
              if (controller.appState is SuccessState) {
                final movies = controller.movieLists;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MoviesCarousel(
                        carouselTitle: 'Em cartaz',
                        movies: movies.nowPlaying,
                      ),
                      const SizedBox(height: 20,),
                      MoviesCarousel(
                        carouselTitle: 'Mais bem avaliados',
                        movies: movies.topRated,
                      ),
                      const SizedBox(height: 20,),
                      MoviesCarousel(
                        carouselTitle: 'Populares',
                        movies: movies.popular,
                      ),
                      const SizedBox(height: 20,),
                      MoviesCarousel(
                        carouselTitle: 'Próximas estreias',
                        movies: movies.upComing,
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                );
              }
              return const FailureWidget();
            },
          ),
        ),
      ),
    );
  }
}
