// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/laporan_api.dart';
import 'package:ayopemilu_mobile/data/models/laporan_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan/laporan_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class LaporanDetailController extends GetxController {
  String laporanId = '0';
  bool loadingLaporan = true;
  LaporanAPI laporanAPI = LaporanAPI();

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

  LaporanModel laporanData = LaporanModel(
    id: 0,
    electionId: 0,
    title: '',
    picture: 'none.png',
    description: '',
    feedback: '',
    status: '',
    createdAt: '',
    updatedAt: '',
    createdBy: 0,
    createdName: '',
    updatedBy: 0,
    updatedName: '',
  );

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      laporanId = data['id']!;
      await getDetail(data['id']);
    }
  }

  getDetail(id) async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await laporanAPI.getById(id);
      if (res) {
        loadingLaporan = false;
        laporanData = LaporanModel.fromMap(data);
        update();
      } else {
        loadingLaporan = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingLaporan = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionDelete(id) async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) = await laporanAPI.delete(id);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        final LaporanController listController = Get.find();
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
