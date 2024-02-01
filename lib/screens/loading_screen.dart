import 'package:flutter/material.dart';
import 'package:hcdrs_app/screens/screens.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

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
          child: CircularProgressIndicator(
            color: Colors.indigo,
          ),
        ));
  }
}
