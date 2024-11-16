import 'admin_customer.dart';
import 'admin_user.dart';
import 'product.dart';

// Fungsi Asynchronous untuk Fetch Produk dari Server
Future<Product> fetchProductDetails(String productName) async {
  await Future.delayed(Duration(seconds: 2));
  return Product(productId: 4,productName: productName, price: 99.99,
  inStock: true,category: 'Electronics',
  );
}

void main() async {
  AdminUser admin = AdminUser(name: 'Admin 1', age: 35);
  admin.products = [];
  CustomerUser customer = CustomerUser(name: 'Customer 1', age: 28);
  customer.products = [];

  Map<int, Product> productMap = {};
  Set<String> productCategories = {'Electronics', 'Accessories'};

  Product product1 = Product(productId: 1,productName: 'Laptop',price: 1000.00,
                              inStock: true,category: 'Electronics');
  Product product2 = Product(productId: 2,productName: 'Headphones',price: 150.00,
                              inStock: true,category: 'Accessories');
  Product product3 = Product(productId: 3, productName: 'Mouse',price: 50.00,
                              inStock: false,category: 'Accessories'); // Out of stock

  productMap[product1.productId] = product1;
  productMap[product2.productId] = product2;
  productMap[product3.productId] = product3;

  productCategories.add(product1.category);
  productCategories.add(product2.category);
  productCategories.add(product3.category);

  // Menambah produk menggunakan admin
  try {
    admin.addProduct(product1);
    admin.addProduct(product2);
    admin.addProduct(product3);
  } catch (e) {
    print('Error: $e');
  }

  // Menampilkan produk setelah penambahan
  print('\nAdmin Product List:');
  admin.showProducts();

  // Customer hanya bisa melihat produk
  print('\nCustomer Product List:');
  customer.viewProducts();

  // Menampilkan produk dari Map berdasarkan ID
  print('\nProduk di dalam Map berdasarkan ID:');
  productMap.forEach((id, product) {
    print(
        'ID: $id, Nama Produk: ${product.productName}, Harga: ${product.price}');
  });

  print('\nKategori Produk Unik:');
  for (var category in productCategories) {
    print(category);
  }

  print('\nFetching product details for "Smartphone"...');
  Product fetchedProduct = await fetchProductDetails('Smartphone');
  print(
      'Fetched product: ${fetchedProduct.productName}, Price: \$${fetchedProduct.price}');
}
