import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_preferences/preferencias_user.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.red : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero} '),
          Divider(),
          Text('Nombre de Usuario : ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
