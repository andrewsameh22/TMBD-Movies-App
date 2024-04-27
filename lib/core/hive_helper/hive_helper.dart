import 'package:hive/hive.dart';

import '../../movies/domain/entities/movie_entity.dart';
import '../constants/constants.dart';

var localMoviesBox;
List<Movie> locallySavedMovies = [];

Future<void> openMoviesBox() async {
  localMoviesBox ??= await Hive.openBox(localMoviesBoxName);
  print('opened');
}

Future<void> saveMovies({
  required List<Movie>? movies,
}) async {
  await openMoviesBox();
  await localMoviesBox.put(localMoviesKey, movies);
  print('saved');
  getSavedMovies();
}

Future<void> getSavedMovies() async {
  await openMoviesBox();
  print('opened from get');
  try {
    List<dynamic> list = localMoviesBox.get(localMoviesKey) ?? [];
    if (list != null && list.isNotEmpty) {
      locallySavedMovies.clear();
      for (var movieItem in list) {
        Movie movie = Movie(
          title: movieItem.title,
          backdropPath: movieItem.backdropPath,
          id: movieItem.id,
          releaseDate: movieItem.releaseDate,
        );
        locallySavedMovies.add(movie);
      }
      print(list[0].title);
    }
  } catch (e) {
    print(e.toString());
  }
  print('fetched');
  print('locallySavedMovies' + locallySavedMovies.toString());
  print(locallySavedMovies[0].title);
}
