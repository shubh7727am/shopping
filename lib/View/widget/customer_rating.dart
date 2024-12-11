import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;  // Rating value
  final int itemCount;  // Number of items (stars)
  final double itemSize; // Size of each item (star)

  const CustomRatingBar({super.key,
    required this.rating,
    required this.itemCount,
    required this.itemSize,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.pink,
      ),
      itemCount: itemCount,
      itemSize: itemSize,
      direction: Axis.horizontal,
    );
  }
}
