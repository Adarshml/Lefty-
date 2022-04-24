import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _Active = prefs.getString('ff_Active') ?? _Active;
    _grtrthanzero = prefs.getInt('ff_grtrthanzero') ?? _grtrthanzero;
  }

  SharedPreferences prefs;

  String _Active = 'Active';
  String get Active => _Active;
  set Active(String _value) {
    _Active = _value;
    prefs.setString('ff_Active', _value);
  }

  int _grtrthanzero = 0;
  int get grtrthanzero => _grtrthanzero;
  set grtrthanzero(int _value) {
    _grtrthanzero = _value;
    prefs.setInt('ff_grtrthanzero', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
