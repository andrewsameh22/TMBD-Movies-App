import 'package:flutter/foundation.dart';
import 'package:tmdb_movies_app/core/constants/constants.dart';
import 'package:tmdb_movies_app/movies/data/datasource/base_movies_local_data_source.dart';
import 'package:tmdb_movies_app/movies/domain/entities/movie_entity.dart';

import '../../../core/hive_helper/hive_helper.dart';

class MoviesLocalDataSource extends BaseMoviesLocalDataSource {
  @override
  Future<void> fetchLocalMovies() async {
    try {
      await getSavedMovies();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
