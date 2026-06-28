import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategoryChips({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;
          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (_) => onSelected(category),
          );
        },
      ),
    );
  }
}
