import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item.dart';
import '../models/order.dart';
import '../models/product.dart';

class OrdersProvider extends ChangeNotifier {
  static const _prefsKey = 'orders';

  final List<Product> _catalog;
  final List<Order> _orders = [];

  OrdersProvider(this._catalog) {
    _load();
  }

  List<Order> get orders => List.unmodifiable(_orders);

  Order placeOrder(List<CartItem> cartItems, double total) {
    final order = Order(
      id: 'ORD-${DateTime.now().millisecondsSinceEpoch}',
      date: DateTime.now(),
      items: cartItems
          .map((i) => CartItem(product: i.product, quantity: i.quantity))
          .toList(),
      total: total,
      status: OrderStatus.processing,
    );
    _orders.insert(0, order);
    _save();
    notifyListeners();
    return order;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_prefsKey);
    if (raw == null) {
      _seedSampleOrders();
      notifyListeners();
      return;
    }
    final decoded = (jsonDecode(raw) as List).cast<Map<String, dynamic>>();
    _orders
      ..clear()
      ..addAll(decoded.map((json) => Order.fromJson(json, _catalog)));
    notifyListeners();
  }

  void _seedSampleOrders() {
    if (_catalog.length < 3) return;
    _orders.addAll([
      Order(
        id: 'ORD-1001',
        date: DateTime.now().subtract(const Duration(days: 6)),
        items: [
          CartItem(product: _catalog[0], quantity: 1),
          CartItem(product: _catalog[2], quantity: 2),
        ],
        total: _catalog[0].price + (_catalog[2].price * 2),
        status: OrderStatus.delivered,
      ),
      Order(
        id: 'ORD-1002',
        date: DateTime.now().subtract(const Duration(days: 2)),
        items: [CartItem(product: _catalog[4], quantity: 1)],
        total: _catalog[4].price,
        status: OrderStatus.shipped,
      ),
    ]);
    _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(_orders.map((o) => o.toJson()).toList());
    await prefs.setString(_prefsKey, encoded);
  }
}
