import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_token != '') {
      return _token;
    }
    return _token;
  }

  Future<bool> authenticate(String email, String password) async {
    final url = Uri.parse('https://reqres.in/api/login');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {'email': email, 'password': password},
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['token'];
      notifyListeners();
    } catch (error) {
      print(error);
    }
    var go;
    if (email == 'eve.holt@reqres.in' && password == 'cityslicka') {
      go = true;
    } else {
      go = false;
    }
    return go;
  }

  void logout() async {
    _token = ' ';
    notifyListeners();
  }
}
