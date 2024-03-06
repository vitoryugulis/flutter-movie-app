import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presenter/utils/styles.dart';
import 'package:lottie/lottie.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  final String emptyLottie = 'assets/lottie/ghost.json';
  const EmptyFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'Você não tem nenhum favorito ainda',
                  style: Styles.mdText,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Lottie.asset(emptyLottie),
            ],
          ),
        ],
      ),
    );
  }
}
