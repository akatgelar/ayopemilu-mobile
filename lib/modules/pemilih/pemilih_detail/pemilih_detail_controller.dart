// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/pemilih_api.dart';
import 'package:ayopemilu_mobile/data/models/pemilih_model.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih/pemilih_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class PemilihDetailController extends GetxController {
  String pemilihId = '0';
  bool loadingPemilih = true;
  PemilihAPI pemilihAPI = PemilihAPI();

  PemilihModel pemilihData = PemilihModel(
    id: 0,
    name: '',
    gender: '',
    bod: '',
    religion: '',
    nik: '',
    provinsiKode: '',
    provinsiNama: '',
    kotaKode: '',
    kotaNama: '',
    kecamatanKode: '',
    kecamatanNama: '',
    kelurahanKode: '',
    kelurahanNama: '',
    phone: '',
    address: '',
    picture: 'none.png',
    notes: '',
    createdBy: 0,
    createdName: '',
    createdAt: '',
  );

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      pemilihId = data['id']!;
      await getDetail(data['id']);
    }
  }

  getDetail(id) async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await pemilihAPI.getById(id);
      if (res) {
        loadingPemilih = false;
        pemilihData = PemilihModel.fromMap(data);
        update();
      } else {
        loadingPemilih = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingPemilih = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionDelete(id) async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) = await pemilihAPI.delete(id);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        final PemilihController listController = Get.find();
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
