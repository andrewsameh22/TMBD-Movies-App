import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tmdb_movies_app/movies/domain/entities/movie_entity.dart';

import 'core/app_router/routes.dart';
import 'core/app_strings/app_strings.dart';
import 'core/bloc_helper/my_bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/styles/app_colors.dart';

void main() async {
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieAdapter());
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.tmdbBlue,
        appBarTheme: const AppBarTheme(
          color: AppColors.appBarBlue,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          centerTitle: true,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
