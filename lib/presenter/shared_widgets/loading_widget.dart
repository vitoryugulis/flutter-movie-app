import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final String tmdbLogo = 'assets/svg/tmdblogo.svg';
  final String loadingLottie = 'assets/lottie/loading.json';
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                tmdbLogo,
                semanticsLabel: 'TMDB Logo',
                colorFilter: const ColorFilter.mode(
                  Color(0Xff90cea1),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Lottie.asset(loadingLottie),
            ],
          ),
        ],
      ),
    );
  }
}
