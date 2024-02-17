import 'package:flutter/material.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:hcdrs_app/ui/input_decorations.dart';
import 'package:hcdrs_app/widgets/widgets.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AuthBackground(
            child_X: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 230,
              ),
              CardContainer(
                  child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Sector de Jueces',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //ChangeNotifierProvider(
                  //  create: (_) => LoginFormProvider(),
                  //  child:
                  //)
                  _LoginForm(),
                ],
              )),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  TextEditingController passcontrolller = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //final logingForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextFormField(
                autofocus: true,
                controller: passcontrolller,
                autocorrect: false,
                keyboardType: TextInputType.text,
                obscureText: true, //para que no se vea lo que se escribe
                decoration: InputDecorations.authInputDecoration(
                    hintText: '*********',
                    labelText: 'contraseña',
                    prefIcon: Icons.lock_outline),

                //validator: (String? value) {
                //  if (value == null || value.isEmpty) {
                //    return 'La contraseña no puede ser vacio';
                //  }
                //}
              ),
              const SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color.fromARGB(255, 61, 61, 61),
                  disabledColor: const Color.fromARGB(255, 83, 82, 82),
                  elevation: 0,
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    if (passcontrolller.text == 'plagas') {
                      Navigator.pushReplacementNamed(context, 'settings');
                    } else {
                      _showDialog(context);
                      //Navigator.pop(context);
                    }
                    //}
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          )),
    );
  }
}

_showDialog(BuildContext ctx) {
  showDialog(
      context: ctx,
      builder: (context) {
        return SimpleDialog(
          title: const Center(child: Text("Advertencia!")),
          children: <Widget>[
            const Center(child: Icon(Icons.warning)),
            const Center(child: Text("Contraseña incorrecta, - 700 puntos")),
            Center(
                child: TextButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.pop(ctx);
                      if (Preferences.habilitado) {
                        Navigator.pushReplacementNamed(context, 'enigmas');
                      } else {
                        Navigator.pushReplacementNamed(context, 'home');
                      }
                    })),
          ],
        );
      });
}
