import 'cart_item.dart';
import 'product.dart';

enum OrderStatus { processing, shipped, delivered }

extension OrderStatusLabel on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }
}

class Order {
  final String id;
  final DateTime date;
  final List<CartItem> items;
  final double total;
  final OrderStatus status;

  Order({
    required this.id,
    required this.date,
    required this.items,
    required this.total,
    required this.status,
  });

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'items': items.map((i) => i.toJson()).toList(),
        'total': total,
        'status': status.index,
      };

  static Order fromJson(Map<String, dynamic> json, List<Product> catalog) {
    final rawItems = (json['items'] as List).cast<Map<String, dynamic>>();
    final items = rawItems
        .map((i) => CartItem.fromJson(i, catalog))
        .whereType<CartItem>()
        .toList();
    return Order(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      items: items,
      total: (json['total'] as num).toDouble(),
      status: OrderStatus.values[json['status'] as int],
    );
  }
}
