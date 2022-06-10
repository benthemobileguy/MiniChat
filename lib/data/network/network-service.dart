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
      //we need to check for trailing commas if not api response throws error
        String formatted;
        var subString = response.body.substring(response.body.length - 3);
        if(!subString.contains("}")){
          formatted = response.body.substring(0, response.body.length - 3);
          formatted = formatted + "]";
          return jsonDecode(formatted);
        }else{
          var formatted = response.body.substring(0, response.body.length - 3);
          formatted = formatted + "}]";
          return jsonDecode(formatted);
        }

        break;
      default:
        throw ApiException(
          context: context,
          message: "error message from the api",
          code: statusCode,
        );
        break;
    }
  }

}
