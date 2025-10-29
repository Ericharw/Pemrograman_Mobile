import 'package:flutter/material.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/data/jurnal.dart';
import 'package:provider/provider.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key, required this.title});

  final String title;

  @override
  State<LihatJurnalPage> createState() {
    return _LihatJurnalPageState();
  }
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  List<Jurnal> jurnalTersimpan =[];

  @override
  Widget build(BuildContext context) {
    //Panggil data provider dari context
    DataProvider dp = context.watch<DataProvider>();
    this.jurnalTersimpan = dp.jurnalTersimpan;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(jurnalTersimpan[index].kelas),
                  subtitle: Text(jurnalTersimpan[index].mapel),
                  trailing: Text(jurnalTersimpan[index].waktuPembuatan.toString()),
                  onTap: () => {},
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: jurnalTersimpan.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}