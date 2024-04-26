import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_router/routes.dart';
import 'core/app_strings/app_strings.dart';
import 'core/bloc_helper/my_bloc_observer.dart';
import 'core/services/service_locator.dart';

void main() {
  ServiceLocator().init();
  Bloc.observer = MyBlocObserver();

  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
