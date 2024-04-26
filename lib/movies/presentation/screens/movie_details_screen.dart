import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tmdb_movies_app/core/app_strings/app_strings.dart';
import 'package:tmdb_movies_app/movies/presentation/controllers/movie_details_cubit/movie_details_cubit.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/utils/api_constants.dart';
import '../components/static_rating_bar_builder_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String? img;
  final String? heroTag;
  final int? movieId;

  const MovieDetailsScreen({
    required this.img,
    required this.heroTag,
    required this.movieId,
    super.key,
  });

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
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: Text(
                    cubit.detailedMovie?.title ?? '',
                  ),
                  // Add more SliverAppBar configurations here as needed
                ),
                SliverToBoxAdapter(
                  child: Hero(
                    tag: heroTag ?? '',
                    child: FancyShimmerImage(
                      imageUrl: ApiConstants.imageUrl(img ?? ''),
                      boxFit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: cubit.detailedMovie == null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 200.0),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cubit.detailedMovie?.title ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(10),
                              StaticRatingBarWidget(
                                rating:
                                    (cubit.detailedMovie?.voteAverage ?? 0.0) /
                                        2,
                              ),
                              Gap(10),
                              Text(
                                '${AppStrings.genres}: ${(cubit.detailedMovie?.genres.map((e) => e.name).toList().join(', ') ?? '')}',
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Gap(10),
                              Text(
                                cubit.detailedMovie?.overview ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
