import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  String _user;

  bool get isAuth {
    return getToken != null;
  }

  String get getToken {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      // print(_token);
      return _token;
    }
    return null;
  }

  Future<void> login(String username, String password) async {
    const url = 'https://crm.syscomed.es/api_app/1.0/generate_token/';
    var body = json.encode({
      'username': username,
      'password': password,
      // 'returnSecureToken': true,
    });
    try {
      final response = await http.post(
        url,
        body: body,
        headers: {
          "content-type": "application/json",
          // HttpHeaders.authorizationHeader:
          //     ' 16c621a7cf1d08d6645dc9175d8f8f8e8753dc5c'
        },
      );
      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
         print(responseData);
        // return responseData;
        // print(responseData);
        // print(responseData['user']['username']);
        // // print(responseData['token']);
         _token = responseData['token'];
         _expiryDate = DateTime.now().add(
           Duration(days: int.parse(responseData['expires_in'])),
         );
       print(_expiryDate);
        notifyListeners();
      }
      //  Navigator.of(context).pushReplacementNamed('/home');
      if (response.statusCode >= 400) {
        if (responseData['detail'] != null) {
          throw HttpException(responseData['detail']);
        }
        print(responseData['detail']);
      }
    } catch (error) {
      throw error;
    }
  }
}
