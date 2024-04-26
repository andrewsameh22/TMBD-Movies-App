import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb_movies_app/core/app_strings/app_strings.dart';
import 'package:tmdb_movies_app/core/assets_data/assets_data.dart';

import '../../../core/services/service_locator.dart';
import '../components/movie_item_widget.dart';
import '../controllers/movies_cubit/movies_cubit.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesCubit>()..fetchPopularMovies(),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.shade900,
              appBar: null,
              body: RefreshIndicator(
                onRefresh: sl<MoviesCubit>().fetchPopularMovies,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          AppStrings.popularMovies,
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if (cubit.popularMoviesList != null)
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return MovieItemWidget(
                                movie: cubit.popularMoviesList?[index]);
                          },
                          childCount: cubit.popularMoviesList?.length ??
                              0, // Adjust the number of items as needed
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
