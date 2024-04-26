import 'package:flutter/material.dart';

import 'core/app_router/routes.dart';
import 'core/app_strings/app_strings.dart';
import 'core/services/service_locator.dart';

void main() {
  ServiceLocator().init();

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
