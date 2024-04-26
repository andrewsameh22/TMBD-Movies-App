import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

class StaticRatingBarWidget extends StatelessWidget {
  final double rating;

  const StaticRatingBarWidget({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating ?? 0,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemSize: 20,
          itemCount: 5,
          ignoreGestures: true,
          // textDirection: ,//adjust the directionality
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Gap(10),
        Text(
          rating.toStringAsFixed(1) ?? '',
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
