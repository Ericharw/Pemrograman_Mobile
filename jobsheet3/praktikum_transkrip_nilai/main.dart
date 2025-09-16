import 'dart:io';
import 'mata_kuliah.dart';

void main() {
  // Data awal
  List<MataKuliah> transkrip = [
    MataKuliah('IF101', 'Algoritma', 3, 3.5),
    MataKuliah('IF102', 'Basis Data', 3, 4.0),
    MataKuliah('IF103', 'Pemrograman', 4, 3.0),
  ];

  while (true) {
    print('\n=== Menu Transkrip ===');
    print('1. Hitung IPK');
    print('2. Filter Nilai Bagus');
    print('3. Menampilkan Nilai Terformat');
    print('4. Keluar');
    stdout.write('Pilih opsi: ');
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        hitungIPK(transkrip);
        break;
      case '2':
        filterNilaiBagus(transkrip);
        break;
      case '3':
        tampilkanRingkas(transkrip);
        break;
      case '4':
        print('Program selesai.');
        return;
      default:
        print('Opsi tidak valid, coba lagi.');
    }
  }
}

// Fungsi: Hitung IPK
void hitungIPK(List<MataKuliah> transkrip) {
  double totalNilai = transkrip
      .map((mk) => mk.nilai * mk.sks)
      .reduce((a, b) => a + b);
  int totalSks = transkrip.map((mk) => mk.sks).reduce((a, b) => a + b);
  double ipk = totalNilai / totalSks;
  print('\nIPK: ${ipk.toStringAsFixed(2)}');
}

// Fungsi: Filter nilai bagus (≥ 3.5)
void filterNilaiBagus(List<MataKuliah> transkrip) {
  var nilaiBagus = transkrip.where((mk) => mk.nilai >= 3.5);
  print('\nMata kuliah dengan nilai bagus:');
  if (nilaiBagus.isEmpty) {
    print('Tidak ada mata kuliah dengan nilai bagus.');
  } else {
    for (var mk in nilaiBagus) {
      print('${mk.nama} (${mk.nilai})');
    }
  }
}

// Fungsi: Menampilkan daftar ringkas
void tampilkanRingkas(List<MataKuliah> transkrip) {
  print('\nDaftar Ringkas:');
  transkrip.map((mk) => '${mk.nama}: ${mk.nilai}').forEach(print);
}
