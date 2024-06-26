import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_movies_app/core/app_router/pages_animations.dart';
import 'package:tmdb_movies_app/core/splash_screen/splash_screen.dart';
import 'package:tmdb_movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:tmdb_movies_app/movies/presentation/screens/movies_screen.dart';

import 'animation_type.dart';

abstract class AppRouter {
  //Start
  static const splashScreen = '/';
  static const moviesScreen = '/moviesScreen';
  static const moviesDetailsScreen = '/moviesDetailsScreen';

  static final router = GoRouter(
    routes: [
      //splash screen
      GoRoute(
        path: splashScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SplashScreen(),
          animationType: AnimationType.fadeTransitionAnimation,
        ),
      ),
      //movies screen
      GoRoute(
        path: moviesScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const MoviesScreen(),
          animationType: AnimationType.fadeTransitionAnimation,
        ),
      ),

      //movies details screen
      GoRoute(
        path: moviesDetailsScreen,
        pageBuilder: (context, state) {
          return buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: MovieDetailsScreen(
              img: (state.extra as Map)['img'],
              movieId: (state.extra as Map)['movieId'],
              heroTag: (state.extra as Map)['heroTag'],
            ),
            animationType: AnimationType.fadeTransitionAnimation,
          );
        },
      ),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required AnimationType animationType,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (animationType) {
          case AnimationType.fadeTransitionAnimation:
            return fadeTransition(animation: animation, child: child);
          case AnimationType.sideTransitionFromDownToUp:
            return sideTransitionFromDownToUp(
                animation: animation, child: child);
          case AnimationType.sideTransitionFromLtoR:
            return sideTransitionFromLtoR(child: child, animation: animation);
          case AnimationType.sideTransitionFromRtoL:
            return sideTransitionFromRtoL(child: child, animation: animation);
          case AnimationType.sideTransitionFromUpToDown:
            return sideTransitionFromUpToDown(
                child: child, animation: animation);
          case AnimationType.sideTransitionFromDownToUpWithFadeTransition:
            return sideTransitionFromDownToUpWithFadeTransition(
                child: child, animation: animation);
          default:
            return fadeTransition(animation: animation, child: child);
        }
      });
}
