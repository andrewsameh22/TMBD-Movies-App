import 'package:flutter/material.dart';

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
      disabledTextColor: Colors.black,
      child: Text(title ?? ''),
    );
  }
}
