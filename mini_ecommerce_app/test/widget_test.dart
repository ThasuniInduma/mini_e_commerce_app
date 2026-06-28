import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:mini_ecommerce_app/app.dart';
import 'package:mini_ecommerce_app/data/mock_products.dart';
import 'package:mini_ecommerce_app/providers/cart_provider.dart';
import 'package:mini_ecommerce_app/providers/orders_provider.dart';
import 'package:mini_ecommerce_app/providers/theme_provider.dart';

void main() {
  Widget buildApp() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider(mockProducts)),
        ChangeNotifierProvider(create: (_) => OrdersProvider(mockProducts)),
      ],
      child: const MiniEcommerceApp(),
    );
  }

  testWidgets('App boots and shows the splash screen first', (tester) async {
    await tester.pumpWidget(buildApp());

    expect(find.text('Mini Mart'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_rounded), findsOneWidget);
  });

  testWidgets('Splash screen navigates to login screen', (tester) async {
    await tester.pumpWidget(buildApp());

    // Splash screen auto-navigates after ~1.8s.
    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}
