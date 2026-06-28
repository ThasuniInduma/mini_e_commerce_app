import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'data/mock_products.dart';
import 'providers/cart_provider.dart';
import 'providers/orders_provider.dart';
import 'providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider(mockProducts)),
        ChangeNotifierProvider(create: (_) => OrdersProvider(mockProducts)),
      ],
      child: const MiniEcommerceApp(),
    ),
  );
}
