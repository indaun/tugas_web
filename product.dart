class Product {
  int productId;
  String productName;
  double price;
  bool inStock;
  String category;

  Product({
    required this.productId,
    required this.productName,
    required this.price,
    required this.inStock,
    required this.category,
  });

  @override
  String toString() =>
      '$productName (ID: $productId, Price: \$${price.toStringAsFixed(2)}, In stock: $inStock, Category: $category)';
}
