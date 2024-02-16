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
  int tiemporestante = 30;
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
    if (tiemporestante == 30) {
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
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Andá al QR donde inició este enigma y vuelve a escanearlo, \nTienes 5 minutos!\n PD. Si tu tiempo expira, vulve al QR de ayuda, apurate!',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 70),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: Stack(
                      fit: StackFit.expand,
                      //fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: 1 - tiemporestante / 30,
                          strokeWidth: 12,
                          backgroundColor: Colors.blue,
                          valueColor:
                              const AlwaysStoppedAnimation(Colors.white),
                        ),
                        Center(
                          child: Text(
                            tiemporestante == 0
                                ? 'Tiempo Agotado!'
                                : tiemporestante.toString(),
                            style: const TextStyle(fontSize: 40),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  (Preferences.ayudaMode)
                      ? ScanButton(tag: 'timer')
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
