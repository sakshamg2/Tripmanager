import 'package:shared_preferences/shared_preferences.dart';

Future<void> setToken(String JwtToken) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('token', JwtToken);
  print('Saved token: $JwtToken');
}

Future<void> setUserId(int id) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setInt('id', id);
  print('Saved Id: $id');
}
