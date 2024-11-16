// Enum untuk Fase Proyek dan Kategori Produk
enum FaseProyek { Perencanaan, Pengembangan, Evaluasi }

enum Kategori { DataManagement, NetworkAutomation }

enum Peran { Developer, NetworkEngineer, Manager }

mixin Kinerja {
  int produktivitas = 0;

  void tambahProduktivitas(int nilai) {
    if (produktivitas + nilai <= 100) {
      produktivitas += nilai;
    }
  }

  void kurangiProduktivitas(int nilai) {
    if (produktivitas - nilai >= 0) {
      produktivitas -= nilai;
    }
  }

  bool cekProduktivitasManager() => produktivitas >= 85;
}

class ProdukDigital {
  String namaProduk;
  double harga;
  Kategori kategori;

  ProdukDigital(
      {required this.namaProduk, required this.harga, required this.kategori});

  void terapkanDiskon(int jumlahTerjual) {
    if (kategori == Kategori.NetworkAutomation && jumlahTerjual > 50) {
      double hargaDiskon = harga * 0.85;
      if (hargaDiskon >= 200000) {
        harga = hargaDiskon;
      }
    }
  }
}

abstract class Karyawan with Kinerja {
  String nama;
  int umur;
  Peran peran;

  Karyawan(this.nama, {required this.umur, required this.peran});

  void bekerja();

  void cekProduktivitas() {
    if (peran == Peran.Manager && !cekProduktivitasManager()) {
      print("Manager harus memiliki produktivitas minimal 85.");
    }
  }
}

class KaryawanTetap extends Karyawan {
  KaryawanTetap(String nama, {required int umur, required Peran peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print('$nama bekerja sebagai karyawan tetap.');
  }
}

class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(String nama, {required int umur, required Peran peran})
      : super(nama, umur: umur, peran: peran);

  @override
  void bekerja() {
    print('$nama bekerja sebagai karyawan kontrak.');
  }
}

class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<Karyawan> karyawanNonAktif = [];
  static const int maxKaryawanAktif = 20;

  void tambahKaryawan(Karyawan karyawan) {
    if (karyawanAktif.length < maxKaryawanAktif) {
      karyawan.cekProduktivitas();
      karyawanAktif.add(karyawan);
    } else {
      print('Batas maksimal karyawan aktif tercapai.');
    }
  }

  void karyawanResign(Karyawan karyawan) {
    karyawanAktif.remove(karyawan);
  }
}

class Proyek {
  FaseProyek faseSaatIni = FaseProyek.Perencanaan;
  int jumlahHari = 0;
  List<Karyawan> tim = [];

  void tambahkanKaryawanTim(Karyawan karyawan) {
    tim.add(karyawan);
  }

  void perbaruiFase() {
    if (faseSaatIni == FaseProyek.Perencanaan && tim.length >= 5) {
      faseSaatIni = FaseProyek.Pengembangan;
    } else if (faseSaatIni == FaseProyek.Pengembangan && jumlahHari > 45) {
      faseSaatIni = FaseProyek.Evaluasi;
    }
  }
}

void main() {
  // Membuat instance produk digital
  var produk1 = ProdukDigital(
      namaProduk: "Data Management System",
      harga: 150000,
      kategori: Kategori.DataManagement);
  var produk2 = ProdukDigital(
      namaProduk: "Network Automation System",
      harga: 250000,
      kategori: Kategori.NetworkAutomation);

  produk2.terapkanDiskon(51);
  print("Harga setelah diskon untuk ${produk2.namaProduk}: ${produk2.harga}");

  var karyawan1 = KaryawanTetap("Alice", umur: 30, peran: Peran.Developer);
  var karyawan2 =
      KaryawanKontrak("Bob", umur: 25, peran: Peran.NetworkEngineer);

  karyawan1.bekerja();
  karyawan2.bekerja();

  var perusahaan = Perusahaan();
  perusahaan.tambahKaryawan(karyawan1);
  perusahaan.tambahKaryawan(karyawan2);

  print("Jumlah karyawan aktif: ${perusahaan.karyawanAktif.length}");

  perusahaan.karyawanResign(karyawan2);
  print(
      "Jumlah karyawan aktif setelah resign: ${perusahaan.karyawanAktif.length}");
  print("Jumlah karyawan non-aktif: ${perusahaan.karyawanNonAktif.length}");

  var proyek = Proyek();
  proyek.tambahkanKaryawanTim(karyawan1);
  proyek.tambahkanKaryawanTim(karyawan2);

  proyek.perbaruiFase();
  print("Fase proyek saat ini: ${proyek.faseSaatIni}");

  for (int i = 0; i < 3; i++) {
    proyek.tambahkanKaryawanTim(
        KaryawanTetap("Karyawan$i", umur: 28, peran: Peran.Developer));
  }

  proyek.perbaruiFase();
  print("Fase proyek setelah memenuhi syarat tim: ${proyek.faseSaatIni}");

  proyek.jumlahHari = 46;
  proyek.perbaruiFase();
  print("Fase proyek setelah 46 hari: ${proyek.faseSaatIni}");
}
