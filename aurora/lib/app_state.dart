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
    _isWelcomed = prefs.getBool('ff_isWelcomed') ?? _isWelcomed;
  }

  late SharedPreferences prefs;

  bool _isWelcomed = false;
  bool get isWelcomed => _isWelcomed;
  set isWelcomed(bool _value) {
    _isWelcomed = _value;
    prefs.setBool('ff_isWelcomed', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
