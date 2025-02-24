import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/dtos/authentication_dto.dart';
import '../../initialize_dependencies.dart';

class LocalService {
  final String keyAuth = 'key_auth';

  final _sharedPref = sl.get<SharedPreferences>();

  bool isAuthorized() {
    return _sharedPref.containsKey(keyAuth);
  }

  Future saveAuth({required AuthenticationDto? auth}) async {
    if (auth != null) {
      await _sharedPref.setString(keyAuth, jsonEncode(auth.toJson()));
    } else {
      await _sharedPref.clear();
    }
  }

  AuthenticationDto? getAuthenticationDto() {
    if (_sharedPref.containsKey(keyAuth)) {
      final authData = jsonDecode(_sharedPref.getString(keyAuth) ?? '');
      return AuthenticationDto.fromJson(authData);
    } else {
      return null;
    }
  }
}
