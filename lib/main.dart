import 'package:flutter/material.dart';
import 'package:hcdrs_app/Providers/scan_list_provider.dart';

import 'package:hcdrs_app/screens/screens.dart';
import 'package:hcdrs_app/services/servises.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //para asegurar que el procedimiento de abajo pueda pasar
  await Preferences.init();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Mediante estos metodos podemos llamar desde cualquier parte de la plicacion
        ChangeNotifierProvider(
          create: (_) => EnigmaService(),
        ),
        ChangeNotifierProvider(create: (_) => ScanService())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HCDRS App',
      initialRoute: Preferences.habilitado ? 'enigmas' : 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'settings': (_) => const SettingsScreen(),
        'enigmas': (_) => const EnigmasScreen(),
        'master': (_) => const MasterScreen(),
        'mapa': (_) => const MapaPage(),
        'timer': (_) => const TimerScreen(),
        'ayuda': (_) => const AyudaScreen(),
      },
      scaffoldMessengerKey: NotificationsService
          .messengerKey, //en cualquier parte de la aplicacion tendre acceso a este scaffold
      theme: ThemeData.dark().copyWith(
          //scaffoldBackgroundColor: Colors.grey[300],
          //appBarTheme: const AppBarTheme(
          //    elevation: 0, color: Color.fromARGB(255, 30, 11, 235)),
          //floatingActionButtonTheme: const FloatingActionButtonThemeData(
          //    backgroundColor: Color.fromARGB(255, 30, 11, 235), elevation: 0)
          ),
    );
  }
}
