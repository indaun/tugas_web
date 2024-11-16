import 'user_.dart';
import 'product.dart';

class AdminUser extends User {
  AdminUser({required super.name, required super.age})
      : super(role: Role.Admin);

  // Menambah produk ke daftar produk pengguna
  void addProduct(Product product) {
    if (!product.inStock) {
      throw Exception(
          'Cannot add product "${product.productName}". It is out of stock.');
    }
    if (!products.contains(product)) {
      products.add(product);
      print('Product "${product.productName}" added successfully.');
    } else {
      print('Product "${product.productName}" already exists.');
    }
  }

  // Menghapus produk dari daftar produk pengguna
  void removeProduct(Product product) {
    if (products.contains(product)) {
      products.remove(product);
      print('Product "${product.productName}" removed successfully.');
    } else {
      print('Product "${product.productName}" not found.');
    }
  }
}
