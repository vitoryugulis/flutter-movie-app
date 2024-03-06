import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FailureWidget extends StatelessWidget {
  final String errorLottie = 'assets/lottie/error.json';
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Lottie.asset(errorLottie),
            ],
          ),
        ],
      ),
    );
  }
}
