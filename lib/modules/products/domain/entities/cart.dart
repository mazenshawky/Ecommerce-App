class Cart {
  final int id;
  final List<CartProduct> cartProducts;

  Cart({
    required this.id,
    required this.cartProducts,
  });
}

class CartProduct {
  final int productId;
  final int quantity;

  CartProduct({
    required this.productId,
    required this.quantity,
  });
}
