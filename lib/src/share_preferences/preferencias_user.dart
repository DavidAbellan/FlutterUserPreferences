import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Patron SingleTon
  static final PreferenciasUsuario _instance =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instance;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //ninguna de estas propiedades se usa
  bool _colorSecundario;
  int _genero;
  String _nombre;

  //GET y SET
  get genero {
    //?? 1 --- si no existe se inicializa a 1
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int genero) {
    _prefs.setInt('genero', genero);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool colorSecundario) {
    _prefs.setBool('colorSecundario', colorSecundario);
  }

  get nombre {
    //?? 1 --- si no existe se inicializa a 1
    return _prefs.getString('nombre') ?? 'Anónimo';
  }

  set nombre(String nombre) {
    _prefs.setString('nombre', nombre);
  }

  get ultimaPagina {
    //?? 1 --- si no existe se inicializa a 1
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String pagina) {
    _prefs.setString('ultimaPagina', pagina);
  }
}
