import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hcdrs_app/Providers/scan_list_provider.dart';

import 'package:hcdrs_app/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  //final State state;
  final Function? cambiostate;
  final String tag;
  const ScanButton({Key? key, this.cambiostate, required this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: tag,
        child: const Icon(Icons.qr_code_scanner_outlined),
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'cancelar', false, ScanMode.QR);

          //String barcodeScanRes = 'geo:-25.349718,-55.692226';
          //String barcodeScanRes ='https://youtu.be/TnVXhA4MDOs?si=rDaNxT8mNBkN7_5a';
          //String barcodeScanRes = 'xx2';

          if (barcodeScanRes == -1) {
            return;
          }

          final scanService = Provider.of<ScanService>(context, listen: false);

          final nuevoScan = await scanService.nuevoScan(barcodeScanRes);
          launch(context, nuevoScan, cambiostate);
        });
  }
}
