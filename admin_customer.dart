import 'user_.dart';

class CustomerUser extends User {
  CustomerUser({required super.name, required super.age})
      : super(role: Role.Customer);
  // Customer hanya bisa melihat produk
  void viewProducts() {
    showProducts();
  }
}
