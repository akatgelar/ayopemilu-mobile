// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/relawan_api.dart';
import 'package:ayopemilu_mobile/data/models/relawan_model.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan/relawan_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class RelawanDetailController extends GetxController {
  String relawanId = '0';
  bool loadingRelawan = true;
  RelawanAPI relawanAPI = RelawanAPI();

  RelawanModel relawanData = RelawanModel(
    id: 0,
    name: '',
    email: '',
    gender: '',
    bod: '',
    phone: '',
    address: '',
    picture: 'none.png',
    expiredDate: '',
    notes: '',
    createdName: '',
    createdAt: '',
  );

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      relawanId = data['id']!;
      await getDetail(data['id']);
    }
  }

  getDetail(id) async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await relawanAPI.getById(id);
      if (res) {
        loadingRelawan = false;
        relawanData = RelawanModel.fromMap(data);
        update();
      } else {
        loadingRelawan = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingRelawan = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionDelete(id) async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) = await relawanAPI.delete(id);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        final RelawanController listController = Get.find();
        listController.removeDataIndex(id);
      } else {
        EasyLoading.dismiss();
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      EasyLoading.dismiss();
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  alertConfirm(context, id) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "",
      desc: "Yakin dihapus?",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            actionDelete(id);
          },
          color: ThemeColor.green,
          width: 120,
          child: const Text(
            "Ya",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: ThemeColor.red,
          width: 120,
          child: const Text(
            "Tidak",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
