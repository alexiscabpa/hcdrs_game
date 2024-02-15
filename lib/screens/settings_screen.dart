import 'package:flutter/material.dart';
import 'package:hcdrs_app/services/enigma_services.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const List<String> secuenciasSG = <String>[
    '1er enigma',
    '2do enigma',
    '3er enigma',
    '4to enigma',
    '5to enigma',
    '6to enigma',
    '7to enigma',
    '8vo enigma',
    '9no enigma',
    '10mo enigma'
  ];
  String dropdownValue = secuenciasSG[Preferences.sg - 1];

  @override
  Widget build(BuildContext context) {
    final enigmasSevice = Provider.of<EnigmaService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ajustes inciales',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
              const Divider(),

              const Text('Equipo al cual pertenece: ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.igle,
                  title: const Text('EFESO'),
                  onChanged: (value) {
                    Preferences.igle = value ?? 1;
                    Preferences.secuencia = [
                      'xx1',
                      'xx7',
                      'xx3',
                      'xx2',
                      'xx4',
                      'xx8',
                      'xx5',
                      'xx9',
                      'xx6',
                      'xx10'
                    ];
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.igle,
                  title: const Text('LAODICEA'),
                  onChanged: (value) {
                    Preferences.igle = value ?? 2;
                    Preferences.secuencia = [
                      'xx4',
                      'xx6',
                      'xx5',
                      'xx7',
                      'xx3',
                      'xx1',
                      'xx2',
                      'xx9',
                      'xx8',
                      'xx10'
                    ];
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 3,
                  groupValue: Preferences.igle,
                  title: const Text('SARDIS'),
                  onChanged: (value) {
                    Preferences.igle = value ?? 3;
                    Preferences.secuencia = [
                      'xx7',
                      'xx2',
                      'xx1',
                      'xx6',
                      'xx5',
                      'xx4',
                      'xx3',
                      'xx8',
                      'xx9',
                      'xx10'
                    ];
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 4,
                  groupValue: Preferences.igle,
                  title: const Text('FILADELFIA'),
                  onChanged: (value) {
                    Preferences.igle = value ?? 4;
                    Preferences.secuencia = [
                      'xx3',
                      'xx8',
                      'xx9',
                      'xx2',
                      'xx5',
                      'xx7',
                      'xx1',
                      'xx6',
                      'xx4',
                      'xx10'
                    ];
                    setState(() {});
                  }),
              const Divider(),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    const Text('Secuencia actual: ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15)),
                    DropdownButton(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 15),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        items: secuenciasSG
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                            final String sg;
                            if (value[1] == '0') {
                              sg = value[0] + '0';
                              //print('value: ' + sg);
                            } else {
                              sg = value[0];
                              //print('value: ' + sg);
                            }

                            Preferences.sg = int.parse(sg);
                          });
                        }),
                  ],
                ),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                  value: Preferences.habilitado,
                  title: const Text(
                    'Habilitacion de inicio',
                    style: TextStyle(fontSize: 15),
                  ),
                  onChanged: (value) {
                    Preferences.habilitado = value;
                    //final themeProvider =
                    //    Provider.of<ThemeProvider>(context, listen: false);
                    //value
                    //    ? themeProvider.setDarkMode()
                    //    : themeProvider.setLightMode();
                    setState(() {});
                  }),
              const Divider(),
              SwitchListTile.adaptive(
                  value: Preferences.ayudaMode,
                  title: const Text(
                    'Modo Ayuda',
                    style: TextStyle(fontSize: 15),
                  ),
                  onChanged: (value) {
                    Preferences.ayudaMode = value;
                    //final themeProvider =
                    //    Provider.of<ThemeProvider>(context, listen: false);
                    //value
                    //    ? themeProvider.setDarkMode()
                    //    : themeProvider.setLightMode();
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Terminado : ${Preferences.termino}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Preferences.termino = "";
                          setState(() {});
                        },
                        child: const Text('Borrar'))
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Copas halladas : ${Preferences.copas}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        onPressed: () {
                          Preferences.copas = 0;
                          setState(() {});
                        },
                        child: const Text('Reiniciar'))
                  ],
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Secuencia asignada: ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              //const Divider(),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Preferences.secuencia.length,
                  itemBuilder: (context, index) {
                    return Text(
                      '   ${index + 1} : ${Preferences.secuencia[index]}',
                      style: const TextStyle(fontSize: 15),
                    );
                  }),
              //ActionListener(listener: listener, action: action, child: child)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Preferences.copas = 0;
          Preferences.termino = "";
          Preferences.sg = 1;
          Preferences.habilitado = false;
          Preferences.ayudaMode = false;
        },
        child: const Icon(
          Icons.restart_alt,
          semanticLabel: 'Reiniciar datos',
        ),
      ),
    );
  }
}
