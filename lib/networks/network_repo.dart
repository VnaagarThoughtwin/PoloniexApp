import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();

  factory NetworkRepository() {
    return _networkRepository;
  }

  NetworkRepository._internal();

  // Auth SignUp

  getToken( String api) async {
    var client = http.Client();

    try {
      
      var request = await client.post(Uri.parse(api));
      Map<String, dynamic> response = jsonDecode(request.body);
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
