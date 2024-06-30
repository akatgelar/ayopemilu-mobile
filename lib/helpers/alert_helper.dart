import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void alertSuccess(context, alertText) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "",
    desc: alertText,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          Get.back();
        },
        color: ThemeColor.primary,
        width: 120,
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
}

void alertFailed(context, alertText) {
  Alert(
    context: context,
    type: AlertType.error,
    title: "",
    desc: alertText,
    buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(context);
          Get.back();
        },
        color: ThemeColor.primary,
        width: 120,
        child: const Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
  ).show();
}

checkTokenExpired(message) async {
  if (message == 'Error. Unauthenticated.') {
    // print('remove token');
    EasyLoading.dismiss();
    await Future.delayed(const Duration(seconds: 1));
    SessionHelper().removeSession();
    Get.offAllNamed(AppRoutes.login);
  }
}
