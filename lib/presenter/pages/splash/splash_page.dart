import 'package:flutter/material.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/pages/splash/splash_controller.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/failure_widget.dart';
import 'package:flutter_movie_app/presenter/shared_widgets/loading_widget.dart';
import 'package:flutter_movie_app/presenter/states/app_states.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';
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
    return Scaffold(
      backgroundColor: const Color(0XFF0d253f),
      body: ChangeNotifierProvider(
        create: (context) => splashController,
        child: Consumer<SplashController>(
          builder: (context, controller, _) {
            if (controller.appState is LoadingState) {
              return const LoadingWidget();
            }
            return const FailureWidget();
          },
        ),
      ),
    );
  }
}
