import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartBadge extends StatelessWidget {
  final Widget child;

  const CartBadge({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CartProvider>().totalItemCount;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            right: -4,
            top: -4,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Container(
                key: ValueKey(count),
                padding: const EdgeInsets.all(4),
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$count',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
