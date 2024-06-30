// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/user_api.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SettingPasswordController extends GetxController {
  UserAPI userAPI = UserAPI();

  SessionModel session = SessionModel(
    token: '',
    id: 0,
    name: '',
    email: '',
    gender: '',
    bod: '',
    phone: '',
    address: '',
    picture: 'none.png',
    expiredDate: '',
    roleId: 0,
    roleName: '',
    electionId: 0,
    electionCategory: '',
    electionArea: '',
    electionSubarea: '',
    electionVotersAll: 0,
    electionVotersTarget: 0,
    calegId: 0,
  );

  final passwordOldCtrl = TextEditingController(text: '');
  final passwordNewCtrl = TextEditingController(text: '');
  final passwordNewAgainCtrl = TextEditingController(text: '');

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();
  }

  actionUpdate() async {
    if (passwordOldCtrl.text.isEmpty || passwordNewCtrl.text.isEmpty || passwordNewAgainCtrl.text.isEmpty) {
      alertFailed(Get.context, "Password tidak boleh kosong");
    } else {
      if (passwordNewCtrl.text != passwordNewAgainCtrl.text) {
        alertFailed(Get.context, "Password tidak sama");
      } else {
        try {
          EasyLoading.show(status: 'Loading...');

          var body = {
            "password": passwordNewCtrl.text.toString(),
          };

          // ignore: unused_local_variable
          var (res, data, msg, page) = await userAPI.update(session.id, body);
          if (res) {
            EasyLoading.dismiss();
            alertSuccess(Get.context, "Data berhasil disimpan");
          } else {
            EasyLoading.dismiss();
            alertFailed(Get.context, msg);
          }
        } catch (err) {
          EasyLoading.dismiss();
          alertFailed(Get.context, 'Internal Error, $err');
        }
      }
    }
  }
}
