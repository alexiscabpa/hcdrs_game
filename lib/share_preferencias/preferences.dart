import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static int _iglesia = 1;

  static String _llave = 'llave';
  static String _termino = '';
  static int _sg = 1;
  static bool _habilitado = false;
  static bool _ayudaMode = false;
  static List<String> _nombresIgle = [
    "EFESO",
    "LAODICEA",
    "SARDIS",
    "FILADELFIA"
  ];
  static List<String> _secuencia = [
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
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> get secuencia {
    return _prefs.getStringList('secuencia') ?? _secuencia;
  }

  static set secuencia(List<String> list) {
    _secuencia = list;
    _prefs.setStringList('secuencia', list);
  }

  static List<String> get nombresIgle {
    return _prefs.getStringList('nombresIgle') ?? _nombresIgle;
  }

  static set nombresIgle(List<String> list) {
    _nombresIgle = list;
    _prefs.setStringList('nombresIgle', list);
  }

  static String get llave {
    return _prefs.getString('llave') ?? _llave;
  }

  static set llave(String key) {
    _llave = key;
    _prefs.setString('llave', key);
  }

  static String get termino {
    return _prefs.getString('termino') ?? _termino;
  }

  static set termino(String key) {
    _termino = key;
    _prefs.setString('termino', key);
  }

//  static String get s1 {
//    return _prefs.getString('s1') ?? _s1;
//  }
//
//  static set s1(String s) {
//    _s1 = s;
//    _prefs.setString('s1', s);
//  }
//
//  static String get s2 {
//    return _prefs.getString('s2') ?? _s2;
//  }
//
//  static set s2(String s) {
//    _s2 = s;
//    _prefs.setString('s2', s);
//  }
//
//  static String get s3 {
//    return _prefs.getString('s3') ?? _s3;
//  }
//
//  static set s3(String s) {
//    _s3 = s;
//    _prefs.setString('s3', s3);
//  }
//
//  static String get s4 {
//    return _prefs.getString('s4') ?? _s4;
//  }
//
//  static set s4(String s) {
//    _s4 = s;
//    _prefs.setString('s4', s);
//  }
//
//  static String get s5 {
//    return _prefs.getString('s5') ?? _s5;
//  }
//
//  static set s5(String s) {
//    _s5 = s;
//    _prefs.setString('s5', s);
//  }
//
//  static String get s6 {
//    return _prefs.getString('s6') ?? _s6;
//  }
//
//  static set s6(String s) {
//    _s6 = s;
//    _prefs.setString('s6', s);
//  }
//
//  static String get s7 {
//    return _prefs.getString('s7') ?? _s7;
//  }
//
//  static set s7(String s) {
//    _s7 = s;
//    _prefs.setString('s7', s);
//  }
//
//  static String get s8 {
//    return _prefs.getString('s8') ?? _s8;
//  }
//
//  static set s8(String s) {
//    _s8 = s;
//    _prefs.setString('s8', s);
//  }
//
//  static String get s9 {
//    return _prefs.getString('s9') ?? _s9;
//  }
//
//  static set s9(String s) {
//    _s9 = s;
//    _prefs.setString('s9', s);
//  }
//
//  static String get s10 {
//    return _prefs.getString('s10') ?? _s10;
//  }
//
//  static set s10(String s) {
//    _s10 = s;
//    _prefs.setString('s10', s);
//  }
//
  static int get sg {
    return _prefs.getInt('sg') ?? _sg;
  }

  static set sg(int value) {
    _sg = value;
    _prefs.setInt('sg', value);
  }

  static bool get habilitado {
    return _prefs.getBool('habilitado') ?? _habilitado;
  }

  static set habilitado(bool value) {
    _habilitado = value;
    _prefs.setBool('habilitado', value);
  }

  static bool get ayudaMode {
    return _prefs.getBool('ayudaMode') ?? _ayudaMode;
  }

  static set ayudaMode(bool value) {
    _ayudaMode = value;
    _prefs.setBool('ayudaMode', value);
  }

  static int get igle {
    return _prefs.getInt('iglesia') ?? _iglesia;
  }

  static set igle(int value) {
    _iglesia = value;
    _prefs.setInt('iglesia', value);
  }
}
