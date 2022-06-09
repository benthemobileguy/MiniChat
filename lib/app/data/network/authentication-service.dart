import 'package:flutter/material.dart';
import 'package:mini_chat/app/data/network/api-service.dart';

class AuthenticationService extends ApiService {
  BuildContext context;
  AuthenticationService({@required this.context}) : super(context: context);

  Future<Map<String, dynamic>> login
      (String email, String password) async {
    Map<String, String> data = Map();
    data = {
      "username": email,
      "password":password,
    };
    Map<String, dynamic> _response =
    await postReq('login', data);
    return _response;
  }
  Future<Map<String, dynamic>> register
      (String username, String email, String fullname, String dob, String password) async {
    Map<String, String> data = Map();
    data = {
      "username": username,
      "email":email,
      "fullname" : fullname,
      "dob" : dob,
      "password" : password
    };
    Map<String, dynamic> _response =
    await postReq('login', data);
    return _response;
  }
}
