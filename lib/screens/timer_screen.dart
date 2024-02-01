import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';

import '../widgets/widgets.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int tiemporestante = 5;
  //bool exit = false;

  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (tiemporestante > 0) {
        setState(() {
          tiemporestante--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  // void _salir() {
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    if (tiemporestante == 5) {
      _startCountDown();
    }
    if (tiemporestante == 0) {
      Preferences.ayudaMode = false;
      setState(() {});
      //print('tiemporestante: $tiemporestante');
      //print('preferenceMode: ${Preferences.ayudaMode}');
    }

    return Scaffold(
        appBar: (AppBar(
            title: const Center(
          child: Text('Ayuda',
              style: TextStyle(
                fontSize: 25,
              )),
        ))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Tienes 2 minutos para visualizar la ayuda de tu enigma! \n Corre al QR donde inició este enigma y te será revelado la ayuda al volver escanearlo. \n PD. Si no llegas a tiempo deberas volver a iniciar un nuevo intento de ayuda, apúrate antes que tu tiempo expire!',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 115),
                  Text(
                    tiemporestante == 0
                        ? 'Tiempo Agotado!'
                        : tiemporestante.toString(),
                    style: const TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  (Preferences.ayudaMode)
                      ? const ScanButton(tag: 'timer')
                      : FloatingActionButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'enigmas');
                          },
                          child: const Icon(Icons.exit_to_app),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
