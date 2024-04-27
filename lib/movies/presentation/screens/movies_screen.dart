import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movies_app/core/app_strings/app_strings.dart';
import 'package:tmdb_movies_app/core/assets_data/assets_data.dart';

import '../../../core/services/service_locator.dart';
import '../components/movie_item_widget.dart';
import '../components/pagination_button.dart';
import '../controllers/movies_cubit/movies_cubit.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesCubit>()..fetchPopularMovies(page: 1),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: null,
              body: RefreshIndicator(
                onRefresh: () {
                  return cubit.fetchPopularMovies(
                    page: 1,
                  );
                },
                child: CustomScrollView(
                  controller: cubit.scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Image.asset(AssetsData.header2),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          AppStrings.popularMovies,
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if (cubit.popularMoviesList != null) ...[
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
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PaginationButton(
                                title: AppStrings.previous,
                                onPressed: (cubit.selectedPage == 1)
                                    ? null
                                    : () {
                                        if (cubit.selectedPage > 1) {
                                          cubit.selectedPage--;
                                          cubit
                                              .fetchPopularMovies(
                                                  page: cubit.selectedPage)
                                              .then((value) =>
                                                  cubit.scrollToTop());
                                          cubit.refreshCubit();
                                        }
                                      },
                              ),
                              Text(
                                cubit.selectedPage.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              PaginationButton(
                                title: AppStrings.next,
                                onPressed:
                                    (cubit.selectedPage == cubit.totalPages)
                                        ? null
                                        : () {
                                            if (cubit.selectedPage <
                                                cubit.totalPages) {
                                              cubit.selectedPage++;
                                              cubit
                                                  .fetchPopularMovies(
                                                      page: cubit.selectedPage)
                                                  .then((value) =>
                                                      cubit.scrollToTop());

                                              cubit.refreshCubit();
                                            }
                                          },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
