import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_app/movies/presentation/controllers/movie_details_cubit/movie_details_cubit.dart';

import '../../../core/services/service_locator.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int? movieId;

  const MovieDetailsScreen({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsCubit>()..fetchMovieDetails(movieId: movieId),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          var cubit = MovieDetailsCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey.shade900,
            appBar: AppBar(),
            body: cubit.detailedMovie == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(cubit.detailedMovie?.title ?? ''),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
