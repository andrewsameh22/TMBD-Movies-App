import 'package:flutter/material.dart';
import 'package:tmdb_movies_app/core/splash_screen/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }
}
