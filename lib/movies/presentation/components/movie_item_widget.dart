import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/app_router/routes.dart';
import '../../../core/utils/api_constants.dart';
import '../../domain/entities/movie_entity.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie? movie;

  const MovieItemWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final heroTag = 'moviePoster_${movie?.id ?? 0}';

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.moviesDetailsScreen,
            extra: {
              'movieId': movie?.id ?? 0,
              'img': movie?.backdropPath ?? '',
              'heroTag': heroTag ?? ''
            },
          );
        },
        child: Row(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Hero(
                  tag: heroTag,
                  child: FancyShimmerImage(
                    imageUrl: ApiConstants.imageUrl(movie?.backdropPath ?? ''),
                    boxFit: BoxFit.cover,
                    height: 150,
                    width: 150.0,
                  ),
                ),
              ),
            ),
            Gap(
              10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie?.title ?? '',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                    ),
                  ),
                  Gap(15),
                  Text(
                    movie?.releaseDate ?? '',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
