import 'package:flutter/material.dart';

import 'package:hcdrs_app/models/scan_model.dart';

import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:hcdrs_app/utils/sonidos.dart';
import 'package:url_launcher/url_launcher.dart';

launch(BuildContext context, ScanModel scan, Function? cambiostate) async {
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
      if (Preferences.sg < 10) {
        print('entro en el menores a 10 en sg');
        if (scan.valor == Preferences.secuencia[Preferences.sg]) {
          Preferences.sg = Preferences.sg + 1;
          soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
          if (cambiostate != null) {
            cambiostate();
          }
        } else {
          if (scan.valor == Preferences.secuencia[Preferences.sg - 1] &&
              Preferences.ayudaMode) {
            //abrir ayuda screen
            Navigator.pushNamed(context, 'ayuda');
          } else {
            //Si no retorna null el scan
            if (scan.valor != '-1') {
              //en el caso que sea el contenido de ayuda y el modoAyuda activado
              if (scan.valor == 'xx?') {
                //informar que tinene un tiempo limitado para escanear qr de enigma
                Preferences.ayudaMode = true;
                // abrir ScreenTimer
                print('entro como true en la condicion xx?');
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('timer', (route) => false);
              } else {
                //en el caso de que escanees algo que no sea correlativo a la secuencia y sea del tipo 'info', que no tiene http ni geo
                final Uri url = Uri.parse(
                    'https://youtu.be/2DPCNEqeE00?si=vBWw-4mbiyhPua_-');
                launchUrl(url);
              }
            } else {
              //return;
              print('entro en la nada');
            }
          }
        }
      }
      //fin del else
      else {
        print('entro en el segundo');
        if (scan.valor == 'xx11' && Preferences.sg == 10) {
          //If de la victoria
          //TODO ver que poner para el que llega aqui primero!
          soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
          final Uri url =
              Uri.parse('https://youtu.be/eZWv_Dvyz38?si=-ICq5-lYne8VxZa9');
          launchUrl(url);

          print('Ganador del juego ');
          //if (cambiostate != null) {
          //  cambiostate();
          //}
        } else {
          if (scan.valor != '-1') {
            //en el caso que sea el contenido de ayuda y el modoAyuda activado
            if (scan.valor == 'xx?') {
              //informar que tinene un tiempo limitado para escanear qr de enigma
              Preferences.ayudaMode = true;
              // abrir ScreenTimer
              print('entro como true en la condicion xx?');
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('timer', (route) => false);
            } else {
              //TODO ultima ayuda
              if (scan.valor == Preferences.secuencia[Preferences.sg - 1] &&
                  Preferences.ayudaMode) {
                //abrir ayuda screen
                Navigator.pushNamed(context, 'ayuda');
              } else {
                //en el caso de que escanees algo que no sea correlativo a la secuencia y sea del tipo 'info', que no tiene http ni geo
                final Uri url = Uri.parse(
                    'https://youtu.be/2DPCNEqeE00?si=vBWw-4mbiyhPua_-');
                launchUrl(url);
              }
            }
          } else {
            //return;
            print('entro en la nada por hacer cancel');
          }
        }
      }
    }
  }
}
