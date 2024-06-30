// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/inventaris_api.dart';
import 'package:ayopemilu_mobile/data/models/inventaris_model.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris/inventaris_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class InventarisDetailController extends GetxController {
  String inventarisId = '0';
  bool loadingInventaris = true;
  InventarisAPI inventarisAPI = InventarisAPI();
  final numberRibuan = NumberFormat.decimalPattern("id_ID");

  InventarisModel inventarisData = InventarisModel(
    id: 0,
    electionId: 0,
    title: '',
    picture: '',
    description: '',
    amount: '',
    unit: '',
    price: '',
    createdAt: '',
  );

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      inventarisId = data['id']!;
      await getDetail(data['id']);
    }
  }

  getDetail(id) async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await inventarisAPI.getById(id);
      if (res) {
        loadingInventaris = false;
        inventarisData = InventarisModel.fromMap(data);
        update();
      } else {
        loadingInventaris = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingInventaris = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionDelete(id) async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) = await inventarisAPI.delete(id);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        final InventarisController listController = Get.find();
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
