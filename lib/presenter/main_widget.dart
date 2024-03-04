import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presenter/pages/splash/splash_page.dart';

class FlutterMovieApp extends StatelessWidget {
  const FlutterMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}