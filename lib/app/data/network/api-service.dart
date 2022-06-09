import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mini_chat/app/data/bloc/index.dart';
import 'package:mini_chat/app/data/network/api-exception.dart';
import 'package:mini_chat/helpers/alert-manager.dart';
import 'package:provider/provider.dart';

class ApiService {
  BuildContext context;
  ApiService({@required this.context}) {
    print('Api service is called ');
  }

  static Future<Map<String, String>> headers({MainBloc bloc}) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    if (bloc != null && bloc.bearerToken != null) {
      headers.addAll({'Authorization': bloc.bearerToken});
    }

    return headers;
  }

  Future<Map<String, dynamic>> getReq(String url) async {
    print('Api service is called to make get request');

    MainBloc bloc = Provider.of<MainBloc>(context, listen:false);
    Map<String, String> _headers = await headers(bloc: bloc);
    http.Response response =
    await http.get(Uri.parse(dotenv.env['API_BASE_URL'] + url), headers: _headers);
    final responseJson = json.decode(response.body);
    print(responseJson.toString());
    int statusCode = response.statusCode;
    print(response.toString());
    switch (statusCode) {
      case 200:
      case 201:
        Map<String, dynamic> data = json.decode(response.body);
        return data;
        break;

      default:
        dynamic data = json.decode(response.body);

        String msg;
        // lord knows why this was encoded twice
        if (data is String) {
          data = json.decode(data);
          msg = "";
          if (data.values.toList().length > 0) {
            // show first error
            msg = data.values .toList().first[0];
          }
        } else {
          if(data['message'] !=null){
            msg = data['message']['name'];
          }
        }

        throw ApiException(
          context: context,
          message: msg,
          code: statusCode,
        );
        break;
    }
  }
  Future<Map<String, dynamic>> postReq(String url, dynamic body,
      {redirectOn401: true}) async {
    print('Api service is called to make post request');
    MainBloc bloc = Provider.of<MainBloc>(context, listen:false);
    Map<String, String> _headers = await headers(bloc: bloc);

    http.Response response = await http.post(
      Uri.parse(dotenv.env['API_BASE_URL'] + url),
      headers: _headers,
      body: json.encode(body),
    );
    final responseJson = json.decode(response.body);
     AlertManager.showToast(responseJson["message"]);
    int statusCode = response.statusCode;
    switch (statusCode) {
      case 200:

      case 201:
        Map<String, dynamic> data = json.decode(response.body);
        return data;
        break;

      case 422:
      case 400:
        dynamic data = json.decode(response.body);
        String msg;
        // lord knows why this was encoded twice
        if (data is String) {
          data = json.decode(data);
          msg = "";
          if (data.values.toList().length > 0) {
            // show first error
            msg = data.values.toList().first[0];
          }
        } else {
          msg = data['responseMessage'];
        }

        throw ApiException(
          context: context,
          message: msg,
          code: statusCode,
        );
        break;
      default:
        dynamic data = json.decode(response.body);
        print("response " + data.toString());
        String msg;
        // lord knows why this was encoded twice
        if (data is String) {
          data = json.decode(data);
          msg = "";
        } else {
          msg = data['responseMessage'];
        }

        throw ApiException(
          context: context,
          message: msg,
          code: statusCode,
          preventRedirect: !redirectOn401,
        );
        break;
    }
  }
}
