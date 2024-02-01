import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hcdrs_app/screens/screens.dart';
import 'package:hcdrs_app/services/servises.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:hcdrs_app/widgets/background.dart';
import 'package:provider/provider.dart';

class AyudaScreen extends StatelessWidget {
  const AyudaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 0.0),
                child: CircleAvatar(
                  maxRadius: 50,
                  backgroundImage:
                      AssetImage('assets/${Preferences.igle.toString()}.jpg'),
                  backgroundColor: Colors.indigo[900],
                ))
          ],
          title: Text(EnigmasScreen.NombresIgle[Preferences.igle - 1]),
        ),
        body: const Center(
          child: Stack(
            children: [
              BackgroundScreen(),
              _body(),
              //FloatingActionButton(
              //  onPressed: () {
              //    Navigator.pop(context);
              //  },
              //  child: const Icon(Icons.exit_to_app),
              //),
            ],
          ),
        ));
  }
}

class _body extends StatelessWidget {
  const _body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final enigmasSevice = Provider.of<EnigmaService>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Ayuda bonus sobre el enigma "${enigmasSevice.enigmas[Preferences.sg - 1].sobre}"',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '"Piensa bien!"',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(62, 66, 107, 0.7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              enigmasSevice.enigmas[Preferences.sg - 1].ayuda,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 25, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
