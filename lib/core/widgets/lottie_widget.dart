import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key,required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      path,
     
      fit: BoxFit.fill,
      filterQuality: FilterQuality.none,
    );
  }
}