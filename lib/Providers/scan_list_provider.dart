import 'package:flutter/material.dart';
import 'package:hcdrs_app/models/scan_model.dart';

class ScanService extends ChangeNotifier {
  List<ScanModel> scans = [];
  bool isreloudeing = false;
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    //final id = await DBProvider.db.nuevoScan(nuevoScan);
    //Asignar el ID de la base de datos al modelo

    if (tipoSeleccionado == nuevoScan.tipo) {
      //scans.insert(0, nuevoScan);
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }
}
