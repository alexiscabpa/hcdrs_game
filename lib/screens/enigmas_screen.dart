import 'package:flutter/material.dart';
import 'package:hcdrs_app/models/scan_model.dart';
import '../Providers/scan_list_provider.dart';
import '../screens/loading_screen.dart';
import '../services/servises.dart';
import '../share_preferencias/preferences.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import 'package:hcdrs_app/utils/utils.dart';

class EnigmasScreen extends StatefulWidget {
  static List<String> NombresIgle = [
    "EFESO",
    "LAODICEA",
    "SARDIS",
    "FILADELFIA"
  ];
  const EnigmasScreen({Key? key}) : super(key: key);

  @override
  State<EnigmasScreen> createState() => _EnigmasScreenState();
}

class _EnigmasScreenState extends State<EnigmasScreen> {
  void cambioState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final enigmasSevice = Provider.of<EnigmaService>(context);
    int auxIdex = 0;
    if (enigmasSevice.isLoading) return const LoadingScreen();
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
      drawer: const SideMenu(),
      body: ListView.builder(
        itemCount: Preferences.sg,
        itemBuilder: (BuildContext context, int index) {
          for (var i = 0; i < 10; i++) {
            if (Preferences.secuencia[index] == enigmasSevice.enigmas[i].id) {
              auxIdex = i;
              // print('service ${enigmasSevice.enigmas[i].id}');
              break;
              //print('preference : ${Preferences.secuencia[Preferences.sg - 1]}');
            }
          }

          return EnigmaCard(
            enigma: enigmasSevice.enigmas[auxIdex],
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ScanButton(cambiostate: cambioState, tag: 'enigmas'),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'mapa',
                  arguments: ScanModel(
                    valor: 'geo:-25.349611,-55.693171',
                  ));
            },
            child: const Icon(Icons.help),
          )
        ],
      ),

      // String barcodeScanRes = await FlutterBarcod  eScanner.scanBarcode(
      //     '#ff6666', 'cancelar', false, ScanMode.QR);

      // onPressed: () {
      //   if (Preferences.sg < 10) {
      //     Preferences.sg = Preferences.sg + 1;
      //     //print('SG: ${Preferences.sg}');
//
      //     setState(() {});
      // }
      //},
      // child: const Icon(Icons.qr_code_scanner_sharp),
    );
  }
}
