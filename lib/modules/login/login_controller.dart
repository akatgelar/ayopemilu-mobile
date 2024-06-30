// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'package:ayopemilu_mobile/data/apis/login_api.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LoginController extends GetxController {
  PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
  );
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  LoginAPI loginAPI = LoginAPI();

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSessionLogin();

    packageInfo = await PackageInfo.fromPlatform();
    update();
  }

  void actionLogin(context) async {
    try {
      if (emailCtrl.text.isEmpty && passwordCtrl.text.isEmpty) {
        alertFailed(context, "Email & Password harus diisi.");
      } else {
        EasyLoading.show(status: 'Loading...');

        var body = {
          "email": emailCtrl.text.toString(),
          "password": passwordCtrl.text.toString(),
        };
        var (res, data, msg) = await loginAPI.login(body);
        if (res) {
          EasyLoading.dismiss();
          SessionModel session = SessionModel.fromMap({
            'token': data['auth']['token'],
            'id': data['data']['id'],
            'name': data['data']['name'],
            'email': data['data']['email'],
            'gender': data['data']['gender'] ?? '',
            'bod': data['data']['bod'] ?? '',
            'phone': data['data']['phone'] ?? '',
            'address': data['data']['address'] ?? '',
            'picture': data['data']['picture'] ?? '',
            'expiredDate': data['data']['expired_date'] ?? '',
            'roleId': data['data']['role']['id'] ?? 0,
            'roleName': data['data']['role']['name'] ?? '',
            'electionId': data['data']['election']['id'] ?? 0,
            'electionCategory': data['data']['election']['category'] ?? '',
            'electionArea': data['data']['election']['area'] ?? '',
            'electionSubarea': data['data']['election']['subarea'] ?? '',
            'electionVotersAll': data['data']['election']['voters_all'] ?? 0,
            'electionVotersTarget': data['data']['election']['voters_target'] ?? 0,
            'calegId': data['data']['caleg_id'] ?? 0,
          });
          SessionHelper().setSession(session);
          Get.offAllNamed(AppRoutes.home);
        } else {
          EasyLoading.dismiss();
          alertFailed(context, msg);
        }
      }
    } catch (err) {
      EasyLoading.dismiss();
      alertFailed(context, 'Internal Error, $err');
    }
  }
}
