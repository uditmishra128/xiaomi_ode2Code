import 'package:flutter/material.dart';

Widget pageIndicator(
  bool isCurrentPage,
) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    height: isCurrentPage ? 8.0 : 5.0,
    width: isCurrentPage ? 16.0 : 5.0,
    decoration: BoxDecoration(
      color: isCurrentPage ? Colors.grey : Colors.grey[200],
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
