import 'package:flutter/material.dart';

class ApiException implements Exception {
  int code;
  String message;
  bool preventRedirect;
  BuildContext context;

  ApiException(
      {this.code,
      this.message,
        this.preventRedirect = false,
        this.context}) {
    switch (code) {

    }
  }
}

