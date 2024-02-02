import 'package:flutter/material.dart';
import 'package:hcdrs_app/models/models.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:hcdrs_app/utils/sonidos.dart';

class EnigmaCard extends StatelessWidget {
  final Enigma enigma;
  const EnigmaCard({Key? key, required this.enigma}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // soundEnigmas(Preferences.secuencia[Preferences.sg - 1]);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      elevation: 20,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              enigma.sobre,
              style: const TextStyle(fontSize: 15),
            ),
            //subtitle: const SizedBox(height: 20),
            leading: CircleAvatar(
              maxRadius: 50,
              backgroundImage:
                  AssetImage('assets/${Preferences.igle.toString()}.jpg'),
              backgroundColor: const Color.fromARGB(255, 84, 84, 85),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline, size: 30),
              onPressed: () {
                _showDialog(context, enigma.obs, enigma.ayuda, enigma.sobre);
              },
            ),
            //arrow_circle_right_outlined),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

_showDialog(BuildContext ctx, String contenido, String? ayuda, String enigm) {
  showDialog(
      context: ctx,
      builder: (context) {
        return SimpleDialog(
          title: Center(
              child: Text(enigm,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold))),
          children: <Widget>[
            const Center(child: Icon(Icons.info_outline)),
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
