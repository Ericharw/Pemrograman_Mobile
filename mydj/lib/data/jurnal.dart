class Jurnal {
  DateTime _waktuPembuatan;
  String kelas;
  String mapel;
  int jamKe;
  String tujuanPembelajaran;
  String materiTopik;
  String kegiatanPembelajaran;
  String profilPembelajaranPancasila;

  // Constructor
  Jurnal({
    this.kelas='',
    this.mapel='',
    this.jamKe=0,
    this.tujuanPembelajaran='',
    this.materiTopik='',
    this.kegiatanPembelajaran='',
    this.profilPembelajaranPancasila='', required String profilPelajarPancasila,
  })
    : _waktuPembuatan = DateTime.now();

  // Getter untuk waktu pembuatan
  get waktuPembuatan => this._waktuPembuatan;
}
