import 'package:flutter/material.dart';
import 'package:hcdrs_app/share_preferencias/preferences.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.games),
            title: const Text('Búsqueda del tesoro'),
            onTap: () {
              if (Preferences.habilitado) {
                Navigator.pushReplacementNamed(context, 'enigmas');
              } else {
                Navigator.pushReplacementNamed(context, 'home');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              //Navigator.pop(context);
              Navigator.pushNamed(context, 'master');
            },
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
    ));
  }
}
