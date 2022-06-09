import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mini_chat/app/data/network/api-exception.dart';

class NetworkService {
  BuildContext context;
  NetworkService({this.context});

  Future<List<dynamic>> get(String url, String path) async {

    http.Response response =
    await http.get(Uri.parse(url +path));
    int statusCode = response.statusCode;
    switch (statusCode) {
      case 200:
        List<dynamic> data = json.decode(response.body);
        return data;
        break;
      default:
        dynamic data = json.decode(response.body);

        throw ApiException(
          context: context,
          message: "error message from the api",
          code: statusCode,
        );
        break;
    }
  }
}
