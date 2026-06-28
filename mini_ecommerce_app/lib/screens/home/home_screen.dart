import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/mock_products.dart';
import '../../models/product.dart';
import '../../providers/theme_provider.dart';
import 'widgets/category_chips.dart';
import 'widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> get _filteredProducts {
    return mockProducts.where((product) {
      final matchesCategory =
          _selectedCategory == 'All' || product.category == _selectedCategory;
      final matchesQuery =
          _query.isEmpty || product.name.toLowerCase().contains(_query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  int _gridColumns(double width) {
    if (width >= 900) return 4;
    if (width >= 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final products = _filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Mart'),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(
              themeProvider.isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: TextField(
                controller: _searchController,
                onChanged: (value) =>
                    setState(() => _query = value.trim().toLowerCase()),
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CategoryChips(
                categories: categories,
                selectedCategory: _selectedCategory,
                onSelected: (category) =>
                    setState(() => _selectedCategory = category),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: products.isEmpty
                  ? const Center(child: Text('No products found'))
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                _gridColumns(constraints.maxWidth),
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.68,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) =>
                              ProductCard(product: products[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
