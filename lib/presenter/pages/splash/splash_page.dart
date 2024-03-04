import 'package:flutter/material.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/pages/splash/splash_controller.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = getIt.get<SplashController>();

  @override
  void initState() {
    super.initState();
    splashController.loadConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    const String tmdbLogo = 'assets/svg/tmdblogo.svg';
    const loadingLottie = 'assets/lottie/loading.json';
    return Scaffold(
      backgroundColor: const Color(0XFF0d253f),
      body: ChangeNotifierProvider(
        create: (context) => splashController,
        child: Consumer<SplashController>(
          builder: (context, controller, _) {
            if (controller.appState is LoadingState) {
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
            return Container();
          },
        ),
      ),
    );
  }
}
