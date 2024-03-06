import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/discover_entity.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/toast_widget.dart';
import 'package:flutter_movie_app/presenter/utils/styles.dart';

class MoviesCarousel extends StatelessWidget {
  final DiscoverEntity movies;
  final String carouselTitle;
  final void Function(ResultEntity favorite) onLongPress;
  const MoviesCarousel({
    required this.carouselTitle,
    required this.movies,
    required this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    movies.results.shuffle();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(carouselTitle, style: Styles.mdText),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.results.length,
            itemBuilder: (context, index) {
              final movie = movies.results[index];
              return GestureDetector(
                onLongPress: () {
                  Toast.show(context, 'Adicionado aos favoritos');
                  onLongPress.call(movie);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: movie.posterFullPath,
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
              );
            },
          ),
        ),
      ],
    );
  }
}
