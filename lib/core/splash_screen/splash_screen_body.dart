import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:tmdb_movies_app/core/app_strings/app_strings.dart';
import 'package:tmdb_movies_app/core/assets_data/assets_data.dart';

import '../../../../core/app_router/routes.dart';
import '../styles/app_colors.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    initNavigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initNavigateToHomeView() {
    Future.delayed(const Duration(seconds: 5), () async {
      GoRouter.of(context).go(AppRouter.moviesScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tmdbBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsData.appLogo),
          ],
        ),
      ),
    );
  }
}
