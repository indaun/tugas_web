void main() {
  //string
  String nama = "Inda";
  print("Nama saya $nama");

  //boolean
  bool kalimat = true;
  print(kalimat);

  //integer
  int bil = 1;
  print(bil);

  //double
  double angka = 2.3;
  print(angka);

  //list
  List contohlist = [1, "halo", true];
  print(contohlist);

  //map
  Map<String, dynamic> orang = {
    'name': 'inda',
    'usia': 20,
    'mahasiswa': kalimat
  };
  print(orang['name']);
  print(orang['usia']);
  print(orang['mahasiswa']);

  //dynamic
  dynamic variabel = 'halo';
  print(variabel);

  variabel = 42;
  print(variabel);

  variabel = true;
  print(variabel);

  //final
  final waktu = DateTime.now();
  print(waktu);

  //const
  const pi = 3.14;
  const tahun = 2024;
  const list = [1, 2, 3];
  print(pi);
  print(tahun);
  print(list[0]);

  /*
  ini adalah komentar multi-baris
  artinya dapat digunakan untuk membuat banyak baris komentar
  */

  //deklarasi fungsi
  int tambah(int a, int b) {
    return a + b;
  }

  print(tambah(4, 2));

  //fungsi tanpa pengembalian (void)
  void message(String pesan) {
    print(pesan);
  }

  //fungsi dengan pengembalian nilai
  double hitungLuas(double jariJari) {
    return pi * jariJari * jariJari;
  }

  print(hitungLuas(5));

  //Fungsi tanpa parameter
  void sayHello() {
    print('Hello');
  }

  sayHello();

  //future
  Future<String> data() {
    return Future.delayed(Duration(seconds: 2), () => 'data diproses');
  }

  data().then((cukup) {
    print(cukup);
  });
  print('Fetching data...');

  //async dan await
  Future<void> fetchData() async {
    print('Fetching data...');
    String data =
        await Future.delayed(Duration(seconds: 3), () => 'Data Loaded');
  }

  fetchData();
  print('Data request terkirim');
}
