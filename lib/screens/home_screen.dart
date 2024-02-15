import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:hcdrs_app/ui/input_decorations.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController passcontrolller = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
        title: Text(Preferences.nombresIgle[Preferences.igle - 1]),
      ),
      drawer: const SideMenu(),
      body: Stack(children: [
        const BackgroundScreen(),
        _body(formkey: formkey, passcontrolller: passcontrolller),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            FocusScope.of(context).unfocus();

            if (passcontrolller.text.toUpperCase() == Preferences.llave) {
              Navigator.pushReplacementNamed(context, 'enigmas');
              Preferences.habilitado = true;
            } else {
              //Navigator.pop(context);
            }
          },
          child: const Icon(Icons.check_circle_outlined)),
    );
  }
}

class _body extends StatelessWidget {
  const _body({
    super.key,
    required this.formkey,
    required this.passcontrolller,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController passcontrolller;

  @override
  Widget build(BuildContext context) {
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Busqueda del Tesoro \n 2024',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '"Hasta que El vuelva"',
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
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              'Parar inciar el juego debes descifrar el enigma y colocar la llave para proseguir con las secuencias...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
                Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          //autofocus: true,
                          style: const TextStyle(fontSize: 20),
                          controller: passcontrolller,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          obscureText:
                              true, //para que no se vea lo que se escribe
                          decoration: InputDecorations.authInputDecoration(
                              hintText: '*********',
                              labelText: 'Llave',
                              prefIcon: Icons.lock_outline),
                        ),

                        const SizedBox(
                          height: 5,
                        ),
                        //BotonIngresar(passcontrolller: passcontrolller)
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//class BotonIngresar extends StatelessWidget {
//  const BotonIngresar({
//    super.key,
//    required this.passcontrolller,
//  });
//
//  final TextEditingController passcontrolller;
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialButton(
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//        color: const Color.fromARGB(255, 61, 61, 61),
//        disabledColor: const Color.fromARGB(255, 83, 82, 82),
//        elevation: 0,
//        onPressed: () {
//          FocusScope.of(context).unfocus();
//
//          if (passcontrolller.text == Preferences.llave) {
//            Navigator.pushReplacementNamed(context, 'enigmas');
//            Preferences.habilitado = true;
//          } else {
//            Navigator.pop(context);
//          }
//          //}
//        },
//        child: Container(
//          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//          child: const Text(
//            'Ingresar',
//            style: TextStyle(color: Colors.white, fontSize: 20),
//          ),
//        ));
//  }
//}
