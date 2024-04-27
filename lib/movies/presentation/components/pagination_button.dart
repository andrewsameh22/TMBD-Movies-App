import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';

class PaginationButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;

  const PaginationButton(
      {required this.title, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: AppColors.tmdbBlue,
      child: Text(
        title ?? '',
        style: const TextStyle(
            color: AppColors.tmdbBlue, fontWeight: FontWeight.bold),
      ),
    );
  }
}
