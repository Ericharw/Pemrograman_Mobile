import 'package:flutter/material.dart';
import 'package:mydj/data/jurnal.dart';

class DataProvider extends ChangeNotifier {
  List<Jurnal> _jurnalTersimpan= [];

  DataProvider();

  // Method untuk menambahkan jurnal baru

  void tambahJurnal(Jurnal jurnal) {
    this._jurnalTersimpan.add(jurnal);
  }

  //Getter untuk jurnal
  get jurnalTersimpan => this._jurnalTersimpan;
}