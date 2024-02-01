import 'package:flutter/material.dart';

import 'package:hcdrs_app/models/scan_model.dart';

import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:url_launcher/url_launcher.dart';

launch(BuildContext context, ScanModel scan, Function cambiostate) async {
  final Uri url = Uri.parse(scan.valor);
  print('SCAN: ${scan.valor}');
  if (scan.tipo == 'http') {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    if (scan.tipo == 'geo') {
      Navigator.pushNamed(context, 'mapa', arguments: scan);
    } else {
      if (scan.valor == Preferences.secuencia[Preferences.sg]) {
        if (Preferences.sg < 10) {
          Preferences.sg = Preferences.sg + 1;
          cambiostate();
        }
      } else {
        //en el caso de que escanees algo que no sea correlativo a la secuencia y sea del tipo 'info', que no tiene http ni geo
        if (scan.valor != '-1') {
          final Uri url =
              Uri.parse('https://youtu.be/2DPCNEqeE00?si=vBWw-4mbiyhPua_-');
          launchUrl(url);
        } else {
          //return;
        }
      }
    }
  }
}
