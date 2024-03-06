import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presenter/utils/styles.dart';

class Toast {
  static void show(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: Styles.smText,
        ),
      ),
    );
  }
}
