import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import './company.dart';

class Companies with ChangeNotifier {
  
  List<dynamic> _companies=[];

  final String authToken;
  Companies(this.authToken, this._companies);

  List<dynamic> get companies {
    return _companies;
  }

  Future<void> fetchAndSetCompanies() async {
    print('I/m called');

    final url = 'https://crm.syscomed.es/api_app/1.0/empresas/';
    try {
      final response = await http.get(
        url,
        headers:<String, String> {
          "content-type": "application/json",
          "Authorization": "Token $authToken",
        },
      );
      // final extractData = json.decode(response.body) as Map<String, dynamic>;
      //print('Token : ${authToken}');
      //print(response);
      print(json.decode(response.body));

      final parseData = json.decode(response.body) as List<dynamic>;
      _companies = parseData ;
      notifyListeners();

      // print(extractData);
    } catch (error) {
      throw (error);
      // print(error);
    }
  }
}
