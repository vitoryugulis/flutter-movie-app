import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/injection.dart';
import 'package:flutter_movie_app/presenter/main_widget.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(const FlutterMovieApp());
}
