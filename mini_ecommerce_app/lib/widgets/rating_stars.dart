import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool showLabel;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, color: Colors.amber, size: size),
        const SizedBox(width: 2),
        if (showLabel)
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              fontSize: size * 0.8,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}
