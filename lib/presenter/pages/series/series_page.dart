import 'package:flutter/material.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/pages/series/series_controller.dart';
import 'package:flutter_movie_app/presenter/pages/series/widgets/series_carousel_widget.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/failure_widget.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/loading_widget.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:provider/provider.dart';

class SeriesPage extends StatefulWidget {
  static const route = '/series';
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  final seriesController = getIt.get<SeriesController>();

  @override
  void initState() {
    super.initState();
    seriesController.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0d253f),
      body: ChangeNotifierProvider(
        create: (context) => seriesController,
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
          child: Consumer<SeriesController>(
            builder: (context, controller, _) {
              if (controller.appState is LoadingState) {
                return const LoadingWidget();
              }
              if (controller.appState is SuccessState) {
                final series = controller.seriesList;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SeriesCarousel(
                        carouselTitle: 'Em exibição hoje',
                        series: series.airingToday,
                        onLongPress: (favorite) =>
                            controller.saveFavorite(favorite),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SeriesCarousel(
                        carouselTitle: 'Mais bem avaliadas',
                        series: series.topRated,
                        onLongPress: (favorite) =>
                            controller.saveFavorite(favorite),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SeriesCarousel(
                        carouselTitle: 'Populares',
                        series: series.popular,
                        onLongPress: (favorite) =>
                            controller.saveFavorite(favorite),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SeriesCarousel(
                        carouselTitle: 'Passando na TV',
                        series: series.onTheAir,
                        onLongPress: (favorite) =>
                            controller.saveFavorite(favorite),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
