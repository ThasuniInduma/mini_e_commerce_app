import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toJson() => {
        'productId': product.id,
        'quantity': quantity,
      };

  static CartItem? fromJson(
    Map<String, dynamic> json,
    List<Product> catalog,
  ) {
    for (final product in catalog) {
      if (product.id == json['productId']) {
        return CartItem(product: product, quantity: json['quantity'] as int);
      }
    }
    return null;
  }
}
