import 'package:dio/dio.dart';
import 'package:tmdb_movies_app/movies/data/datasource/base_movies_remote_data_source.dart';

import '../../../core/failures/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/utils/api_constants.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../models/movie_details_model/movie_details_model.dart';
import '../models/movie_model/movie_model.dart';

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesEndpoint);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      {required MovieDetailsParameters parameters}) async {
    final response = await Dio()
        .get(ApiConstants.movieDetailsEndpoint(movieId: parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
