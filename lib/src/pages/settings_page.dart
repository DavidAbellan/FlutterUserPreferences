import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/share_preferences/preferencias_user.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

//para poder controlar Textfield poner Pedro por defecto
  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    // cargarPref();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
  }

  /*
 con el SingleTon de preferencias user ya no es necesario
  cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState(() {});
  }
*/
  _setSelectedRadio(int valor) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('genero', valor);
    prefs.genero = valor;
    setState(() {
      _genero = valor;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        appBar: AppBar(
          backgroundColor: (prefs.colorSecundario) ? Colors.red : Colors.blue,
          title: Text('Ajustes'),
        ),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              onChanged: (value) => {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                })
              },
              title: Text('Color Secundario'),
            ),
            RadioListTile(
              value: 1,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
              title: Text('masculino'),
            ),
            RadioListTile(
              value: 2,
              groupValue: _genero,
              onChanged: _setSelectedRadio,
              title: Text('femenino'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _textController,
                onChanged: (value) => {prefs.nombre = value},
                decoration: InputDecoration(
                    labelText: 'nombre', helperText: 'nombre del usuario'),
              ),
            )
          ],
        ));
  }
}
