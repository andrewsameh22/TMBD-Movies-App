class ApiConstants {
  static const String baseurl = "https://api.themoviedb.org/3";
  static const String apiKey = "46e11de373f0f984146aef4aa74f327a";

  static const String popularMoviesEndpoint =
      "$baseurl/movie/popular?api_key=$apiKey";

  static String movieDetailsEndpoint({required int movieId}) =>
      "$baseurl/movie/$movieId?api_key=$apiKey";
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
