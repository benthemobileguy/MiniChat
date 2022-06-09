import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_chat/helpers/global-variables.dart';
import 'package:mini_chat/presentation/resources/color-manager.dart';
import 'package:progress_dialog/progress_dialog.dart';

class UtilsHelpers{
  static Future setStatusBar(Color color) async {
    return SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: color));
  }
  static Future<bool> showProgressBar(BuildContext context, String text) {
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
    );
    //Dialog Style
    pr?.style(
      message: text,
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(
            ColorManager.primary),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.bounceIn,
      progressTextStyle: TextStyle(color: ColorManager.primary, fontSize: 14.0),
      messageTextStyle: TextStyle(color: ColorManager.primary, fontSize: 14.0),
    );
    return pr?.show();
  }
}