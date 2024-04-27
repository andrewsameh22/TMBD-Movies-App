import 'package:hive/hive.dart';

import '../../movies/domain/entities/movie_entity.dart';
import '../constants/constants.dart';

var localMoviesBox;
List<Movie> locallySavedMovies = [];

Future<void> openMoviesBox() async {
  localMoviesBox ??= await Hive.openBox(localMoviesBoxName);
}

Future<void> saveMovies({
  required List<Movie>? movies,
}) async {
  await openMoviesBox();
  await localMoviesBox.put(localMoviesKey, movies);
}

Future<void> getSavedMovies() async {
  await openMoviesBox();
  try {
    List<dynamic> list = localMoviesBox.get(localMoviesKey) ?? [];
    if (list != null && list.isNotEmpty) {
      for (var movieItem in list) {
        Movie movie = Movie(
          title: movieItem.title,
          backdropPath: movieItem.backdropPath,
          id: movieItem.id,
          releaseDate: movieItem.releaseDate,
        );
        locallySavedMovies.add(movie);
      }
    }
  } catch (e) {
    print(e.toString());
  }
}
