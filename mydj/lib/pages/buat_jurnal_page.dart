import 'package:flutter/material.dart';
import 'package:mydj/componens/media_selector.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/data/jurnal.dart';
import 'package:provider/provider.dart';


class BuatJurnalPage extends StatefulWidget {
  const BuatJurnalPage({super.key, required this.title});

  final String title;

  @override
  State<BuatJurnalPage> createState() => _BuatJurnalPageState();
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  String kelas = '';
  String mapel = '';
  int jamKe = 0;
  String tujuanPembelajaran = '';
  String materiTopik = '';
  String kegiatanPembelajaran = '';
  String profilPelajarPancasila = '';

  /// Fungsi untuk menyimpan data jurnal
  void simpanJurnal(BuildContext context) {
    if (kelas.isEmpty || mapel.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kelas dan Mapel wajib diisi')),
      );
      return;
    }

    // Buat objek jurnal
    Jurnal j = Jurnal(
      kelas: kelas,
      mapel: mapel,
      jamKe: jamKe,
      tujuanPembelajaran: tujuanPembelajaran,
      materiTopik: materiTopik,
      kegiatanPembelajaran: kegiatanPembelajaran,
      profilPelajarPancasila: profilPelajarPancasila,
    );

    // Simpan ke Provider
    DataProvider dp = context.read<DataProvider>();
    dp.tambahJurnal(j);

    // Tampilkan notifikasi berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Jurnal berhasil disimpan!')),
    );

    // Kosongkan input setelah disimpan
    setState(() {
      kelas = '';
      mapel = '';
      jamKe = 0;
      tujuanPembelajaran = '';
      materiTopik = '';
      kegiatanPembelajaran = '';
      profilPelajarPancasila = '';
    });
  }

  /// Widget text area dengan fungsi onChanged
  Widget _textArea(String label, String info, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(label),
        const SizedBox(height: 10),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: info,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Kelas:'),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan nama kelas',
                ),
                onChanged: (value) => setState(() => kelas = value),
              ),
              const SizedBox(height: 10),
              const Text('Mapel:'),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan nama mata pelajaran',
                ),
                onChanged: (value) => setState(() => mapel = value),
              ),
              const SizedBox(height: 10),
              const Text('Jam Ke-'),
              const SizedBox(height: 10),
              DropdownButtonFormField<int>(
                value: jamKe == 0 ? null : jamKe,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pilih jam yang sesuai',
                ),
                items: List.generate(
                  8,
                      (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('Jam ke-${index + 1}'),
                  ),
                ),
                onChanged: (value) => setState(() => jamKe = value ?? 0),
              ),
              const SizedBox(height: 10),
              _textArea(
                'Tujuan Pembelajaran',
                'Uraikan tujuan pembelajaran',
                    (value) => setState(() => tujuanPembelajaran = value),
              ),
              _textArea(
                'Materi/Topik',
                'Uraikan materi/topik pembelajaran',
                    (value) => setState(() => materiTopik = value),
              ),
              _textArea(
                'Kegiatan Pembelajaran',
                'Uraikan kegiatan pembelajaran',
                    (value) => setState(() => kegiatanPembelajaran = value),
              ),
              _textArea(
                'Profil Pelajar Pancasila',
                'Uraikan profil pelajar',
                    (value) => setState(() => profilPelajarPancasila = value),
              ),
              const SizedBox(height: 20),

              // 🟩 Tambahkan di sini:
              const Text('Dokumentasi Pembelajaran:'),
              const SizedBox(height: 10),
              MediaSelector(mediaType: MediaType.photo),
              const SizedBox(height: 10),
              MediaSelector(mediaType: MediaType.video),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => simpanJurnal(context),
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
