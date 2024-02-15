import 'package:flutter/material.dart';
import 'package:hcdrs_app/utils/sonidos.dart';
import 'package:url_launcher/url_launcher.dart';

import '../share_preferencias/preferences.dart';

//esto poner en la resolucion del enigma de los 144mil (xx3)
TextEditingController controlRespuesta = TextEditingController();

Future? dialogRespuesta(BuildContext contexto, String contenido, String? ayuda,
    String enigm, String? id, Function? cambiostate) {
  controlRespuesta.text = "";
  soundEnigmas(id!);
  showDialog(
      context: contexto,
      builder: (contexto) => AlertDialog(
            title: Center(
                child: Text(enigm,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold))),
            content: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                          maxRadius: 100,
                          backgroundImage:
                              AssetImage('assets/enigmas/$id.jpg')),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        contenido,
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    const Text(
                      'Ingresar respuesta: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                          hintText: 'Respuesta', prefixIcon: Icon(Icons.key)),
                      controller: controlRespuesta,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              //const SizedBox(width: 15),
              TextButton(
                  onPressed: () {
                    if (controlRespuesta.text.toUpperCase() == 'DAN') {
                      Preferences.sg = Preferences.sg + 1;
                      soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
                      if (cambiostate != null) {
                        cambiostate();
                      }
                    } else {
                      //en el caso de que escanees y te equivoques la respuesta
                      final Uri url = Uri.parse(
                          'https://youtu.be/2DPCNEqeE00?si=vBWw-4mbiyhPua_-');
                      launchUrl(url);
                    }
                    Navigator.of(contexto).pop();
                  },
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                width: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(contexto).pop();
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ));
}
