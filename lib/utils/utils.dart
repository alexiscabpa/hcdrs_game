import 'package:flutter/material.dart';
import 'package:hcdrs_app/widgets/dialog_copas.dart';
import 'package:http/http.dart' as http;
import 'package:hcdrs_app/models/scan_model.dart';
import 'dart:convert';
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
          print('primer IF de proseguir enigmas');
          if (scan.valor != 'xx8') {
            Preferences.sg = Preferences.sg + 1;
            soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
          } else {
            if (scan.valor == 'xx8' && Preferences.copas == 0) {
              Preferences.sg = Preferences.sg + 1;
              soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
            }
          }

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
              //para el enigma de las copas
              if (Preferences.copas < 7 &&
                  Preferences.secuencia[Preferences.sg - 1] == 'xx8') {
                if (Preferences.copasIra[Preferences.copas] == scan.valor) {
                  Preferences.copas = Preferences.copas + 1;

                  copasDialog(
                      context); //Aparece una copa simbolica y lanza ubicacion de la siguiente copa
                } else {
                  //en el caso de que escanees algo que no sea correlativo a la secuencia y sea del tipo 'info', que no tiene http ni geo
                  final Uri url = Uri.parse(
                      'https://drive.google.com/file/d/1wtR5qPUudqZYcujMWvx6CY2Jachq7ltu/view?usp=drive_link');
                  launchUrl(url);
                }

                if (Preferences.copas > 0) {
                  if (Preferences.copasIra[Preferences.copas - 1] ==
                      scan.valor) {
                    copasDialog(
                        context); //Aparece una copa simbolica y lanza ubicacion de la siguiente copa
                  }
                }
              } else {
                //en el caso que sea el contenido de ayuda y el modoAyuda activado
                if (scan.valor == 'xx?') {
                  //informar que tinene un tiempo limitado para escanear qr de enigma
                  Preferences.ayudaMode = true;
                  // abrir ScreenTimer
                  //print('entro como true en la condicion xx?');
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('timer', (route) => false);
                } else {
                  //en el caso de que escanees algo que no sea correlativo a la secuencia y sea del tipo 'info', que no tiene http ni geo
                  final Uri url = Uri.parse(
                      'https://drive.google.com/file/d/1wtR5qPUudqZYcujMWvx6CY2Jachq7ltu/view?usp=drive_link');
                  launchUrl(url);
                }
              }
            } else {
              //return;
              print('entro en la nada');
            }
          } //fin elses
        }
      }
      //fin del else
      else {
        // print('entro en el segundo');
        if (scan.valor == 'xx11' && Preferences.sg == 10) {
          //If de la victoria
          //TODO ver que poner para el que llega aqui primero!
          soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
          final Uri url =
              Uri.parse('https://youtu.be/eZWv_Dvyz38?si=-ICq5-lYne8VxZa9');
          launchUrl(url);

          //Algoritmo para extraer la hora y nombre del ganador

          DateTime ahora = DateTime.now();

          print(
              '${Preferences.nombresIgle[Preferences.igle - 1]} a las:${ahora.hour}:${ahora.minute}:${ahora.second}');
          Preferences.termino =
              '${Preferences.nombresIgle[Preferences.igle - 1]} a las ${ahora.hour}:${ahora.minute}:${ahora.second}';
          //print('Ganador del juego ');

          //Actualizar Enigma tesoro el xx11 para revisar quien actualizo primero

          var urlX = Uri.https(
              'flutter-varios-6e212-default-rtdb.firebaseio.com',
              'puestos/${Preferences.igle}.json');
          //print(urlX);
          var response = await http.put(urlX,
              body: jsonEncode({
                'iglesia': '${Preferences.nombresIgle[Preferences.igle - 1]}',
                'informe': '${Preferences.termino}'
              }));
          print('Response status: ${response.statusCode}');

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
                    'https://drive.google.com/file/d/1wtR5qPUudqZYcujMWvx6CY2Jachq7ltu/view?usp=drive_link');
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
