import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/pages/favorites/favorites_controller.dart';
import 'package:flutter_movie_app/presenter/pages/favorites/widgets/empty_favorites_widget.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/failure_widget.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/loading_widget.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:flutter_movie_app/presenter/utils/styles.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  static const route = '/favorites';
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritesController = getIt.get<FavoritesController>();

  @override
  void initState() {
    super.initState();
    favoritesController.retrieveFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0d253f),
      body: ChangeNotifierProvider(
        create: (context) => favoritesController,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
          child: Consumer<FavoritesController>(
            builder: (context, controller, _) {
              if (controller.appState is LoadingState) {
                return const LoadingWidget();
              }
              if (controller.appState is SuccessState &&
                  controller.favorites.isEmpty) {
                return const EmptyFavoritesWidget();
              }
              if (controller.appState is SuccessState) {
                final favorites = controller.favorites;
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    final favorite = favorites[index];
                    return Stack(alignment: Alignment.bottomCenter, children: [
                      GestureDetector(
                        onLongPress: () => controller.removeFavorite(favorite.id),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: favorite.backdropFullPath,
                              errorWidget: (context, url, error) => Container(
                                width: 140,
                                color: Colors.indigo,
                                child: Center(
                                    child: Text(
                                  'Sem poster :(',
                                  style: Styles.smText,
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        favorite.title == ''? favorite.originalTitle : favorite.title,
                        style: Styles.lgText,
                      ),
                    ]);
                  },
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
