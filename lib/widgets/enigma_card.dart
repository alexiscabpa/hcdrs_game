import 'package:flutter/material.dart';
import 'package:hcdrs_app/models/models.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:hcdrs_app/utils/sonidos.dart';
import 'package:hcdrs_app/widgets/dialog_copas.dart';
import 'package:hcdrs_app/widgets/widgets.dart';

class EnigmaCard extends StatelessWidget {
  final Enigma enigma;
  final Function? cambiostate;
  const EnigmaCard({Key? key, required this.enigma, this.cambiostate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      elevation: 10,
      child: Column(
        children: <Widget>[
          //const SizedBox(height: 20),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(5, 15, 0, 15),
            title: Text(
              enigma.sobre,
              style: const TextStyle(fontSize: 15),
            ),
            //subtitle: const SizedBox(height: 20),
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundImage: AssetImage('assets/enigmas/${enigma.id}.jpg'),
              backgroundColor: const Color.fromARGB(255, 84, 84, 85),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline, size: 30),
              onPressed: () {
                if (Preferences.copas > 0 && enigma.id == 'xx8') {
                  copasDialog(context);
                } else {
                  if (enigma.id == 'xx3' &&
                      Preferences.secuencia[Preferences.sg - 1] == 'xx3') {
                    dialogRespuesta(context, enigma.obs, enigma.ayuda,
                        enigma.sobre, enigma.id, cambiostate);
                  } else {
                    _showDialog(context, enigma.obs, enigma.ayuda, enigma.sobre,
                        enigma.id);
                  }
                }
              },
            ),
            //arrow_circle_right_outlined),
            onTap: () {
              if (Preferences.copas > 0 && enigma.id == 'xx8') {
                copasDialog(context);
              } else {
                if (enigma.id == 'xx3' &&
                    Preferences.secuencia[Preferences.sg - 1] == 'xx3') {
                  dialogRespuesta(context, enigma.obs, enigma.ayuda,
                      enigma.sobre, enigma.id, cambiostate);
                } else {
                  _showDialog(context, enigma.obs, enigma.ayuda, enigma.sobre,
                      enigma.id);
                }
              }
            },
          ),

          //const SizedBox(height: 20),
        ],
      ),
    );
  }
}

_showDialog(BuildContext ctx, String contenido, String? ayuda, String enigm,
    String? id) {
  soundEnigmas(id!);
  showDialog(
      context: ctx,
      builder: (context) {
        return SimpleDialog(
          title: Center(
              child: Text(enigm,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold))),
          children: <Widget>[
            Center(
              child: CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage('assets/enigmas/$id.jpg')),
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
            Center(
                child: TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.pop(ctx);
                    })),
          ],
        );
      });
}
