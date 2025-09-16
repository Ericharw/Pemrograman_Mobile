import 'dart:io';
void main() {
  print ('Halo, Dart!');
  print('--------------');

  // 1. Fungsi, Variabel, dan Tipe Data
  fungsiPercobaan1();
  fungsiPercobaan2();
  fungsiPercobaan3();
  fungsiPercobaan4(80);
  fungsiPercobaan5('Ericha', 5);
}

void fungsiPercobaan1() {
  String nama = 'Ericha Rizki Wardani';
  int umur = 20;
  double ipk = 3.79;
  bool lulus = true;

  int padding=13;
  // Print
  print('${'Nama'.padRight(padding)}: $nama');
  print('${'Umur'.padRight(padding)}: $umur');
  print('${'IPK'.padRight(padding)}: $ipk');
  print('${'Sudah Lulus?'.padRight(padding)}: $lulus');
  print('--------------');
}

void fungsiPercobaan2() {
  int a = 10;
  int b = 3;

  int padding=13;
  // Print perhitungan dengan operator
  print('${'Penjumlahan'.padRight(padding)}: ${a + b}');
  print('${'Pembagian'.padRight(padding)}: ${a / b}');
  print('${'Modulus'.padRight(padding)}: ${a % b}');
  print('${'Logika'.padRight(padding)}: ${(a > b) && (b < 5)}');
  print('--------------');
}

void fungsiPercobaan3()
{
  stdout.write('Masukkan nama: ');
  String? nama = stdin.readLineSync();
  print('Halo, $nama!');
  print('--------------');
}

void fungsiPercobaan4(double nilai)
{
  String status;
  if (nilai >= 75)
  {
    status = 'Lulus';
  }
  else
  {
    status = 'Mengulang';
  }
  print('Nilai : $nilai');
  print('Status: $status');
  print('--------------');
}

void fungsiPercobaan5(String nama, double jumlah)
{
  // Perulangan dengan for
  for(int i = 0; i < jumlah; i++)
  {
    print('For ke-$i: $nama');
  }
  print('--------------');
  // Perulangan dengan while
  int j = 0;
  while (j < jumlah)
  {
    print('While ke-$j: $nama');
    j++;
  }
  print('--------------');
}

