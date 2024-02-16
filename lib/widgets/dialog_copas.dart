import 'package:flutter/material.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';

import '../models/scan_model.dart';

copasDialog(BuildContext ctx) {
  //soundEnigmas(id!);
  showDialog(
      context: ctx,
      builder: (context) {
        return SimpleDialog(
          title: Center(
              child: Text('Haz hallado la copa ${Preferences.copas}!',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold))),
          children: <Widget>[
            Center(
              child: CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage(
                      'assets/enigmas/${Preferences.copasIra[Preferences.copas - 1]}.jpg')),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                  child: Text(
                Preferences.copas == 7
                    ? 'Pulsa en el boton "ok" y te mostrará en el mapa en qué direción esta el siguiente Enigma'
                    : 'Busca la siguiente copa, conforme al orden bíblico',
                style: const TextStyle(fontSize: 15),
              )),
            ),
            Center(
                child: Row(
              children: [
                const SizedBox(width: 15),
                TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      if (Preferences.copas == 7) {
                        String coordenada = "";
                        if (Preferences.igle == 1) {
                          //Le lleva al lado del puente2, xx5
                          coordenada =
                              'geo:-25.348377934004137,-55.69188481771313';
                        } else {
                          if (Preferences.igle == 2) {
                            //Le lleva al lado del puente xx10

                            coordenada =
                                'geo:-25.349450478972276, -55.691770719644225';
                          } else {
                            if (Preferences.igle == 3) {
                              //Le lleva al lado del puente xx9
                              coordenada =
                                  'geo:-25.349545578040406, -55.69113523264921';
                            } else {
                              //Le lleva al lado del puente xx9
                              coordenada =
                                  'geo:-25.349545578040406, -55.69113523264921';
                            }
                          }
                        }
                        Navigator.pop(ctx);
                        Navigator.pushNamed(context, 'mapa',
                            arguments: ScanModel(
                              valor: coordenada,
                            ));
                      } else {
                        Navigator.pop(ctx);
                      }
                    }),
                // TextButton(
                //   child: const Text("Ir"),
                //  onPressed: () {
                //ir al mapa de la copa siguiente, en el caso que sea 7ma copa ir al enigma xx8
                // if (Preferences.copas == 1) {
                //   Navigator.pushNamed(context, 'mapa',
                //       arguments: ScanModel(
                //         valor: 'geo:-25.349611,-50.693171',
                //       ));
                // } else {
                //   if (Preferences.copas == 2) {
                //     Navigator.pushNamed(context, 'mapa',
                //         arguments: ScanModel(
                //           valor: 'geo:-25.349611,-51.693171',
                //         ));
                //   } else {
                //     if (Preferences.copas == 3) {
                //       Navigator.pushNamed(context, 'mapa',
                //           arguments: ScanModel(
                //             valor: 'geo:-25.349611,-52.693171',
                //           ));
                //     } else {
                //       if (Preferences.copas == 4) {
                //         Navigator.pushNamed(context, 'mapa',
                //             arguments: ScanModel(
                //               valor: 'geo:-25.349611,-53.693171',
                //             ));
                //       } else {
                //         if (Preferences.copas == 5) {
                //           Navigator.pushNamed(context, 'mapa',
                //               arguments: ScanModel(
                //                 valor: 'geo:-25.349611,-54.693171',
                //               ));
                //         } else {
                //           if (Preferences.copas == 6) {
                //             Navigator.pushNamed(context, 'mapa',
                //                 arguments: ScanModel(
                //                   valor: 'geo:-25.349611,-55.693171',
                //                 ));
                //           } else {
                //             if (Preferences.copas == 7) {
                //               Navigator.pushNamed(context, 'mapa',
                //                   arguments: ScanModel(
                //                     valor: 'geo:-25.349611,-56.693171',
                //                   ));
                //             }
                //           }
                //         }
                //       }
                //     }
                //   }
                // }
                // }),
                const SizedBox(
                  width: 15,
                ),
              ],
            )),
          ],
        );
      });
}
