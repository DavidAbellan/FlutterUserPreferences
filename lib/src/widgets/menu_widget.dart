import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/menu-img.jpg'),
                      fit: BoxFit.cover))),
          ListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              leading: Icon(
                Icons.pages,
                color: Colors.blue,
              ),
              title: Text('Páginas')),
          ListTile(
              onTap: () => {},
              leading: Icon(
                Icons.people,
                color: Colors.blue,
              ),
              title: Text('Gente')),
          ListTile(
              onTap: () => {
                    ///con el navigator.pushnamed se podría regresar
                    ///y con un navigator.pop(context) cerrariamos el drawer menu

                    ///para que no se pueda regresar a la pantalla principal(login)
                    Navigator.pushReplacementNamed(
                        context, SettingsPage.routeName)
                  },
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text('Ajustes'))
        ],
      ),
    );
    ;
  }
}
