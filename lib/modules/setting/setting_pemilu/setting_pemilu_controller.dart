// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/pemilu_api.dart';
import 'package:ayopemilu_mobile/data/models/pemilu_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SettingPemiluController extends GetxController {
  String pemiluId = '0';
  bool loadingPemilu = true;

  PemiluAPI pemiluAPI = PemiluAPI();

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
  PemiluModel pemiluData = PemiluModel(
    id: 0,
    category: '',
    area: '',
    subarea: '',
    votersAll: 0,
    votersTarget: 0,
  );

  final categoryCtrl = TextEditingController(text: '');
  final areaCtrl = TextEditingController(text: '');
  final subareaCtrl = TextEditingController(text: '');
  final votersAllCtrl = TextEditingController(text: '');
  final votersTargetCtrl = TextEditingController(text: '');

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    await getDetail(session.electionId);
  }

  getDetail(id) async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await pemiluAPI.getById(id);
      if (res) {
        loadingPemilu = false;
        pemiluData = PemiluModel.fromMap(data);

        categoryCtrl.text = pemiluData.category;
        areaCtrl.text = pemiluData.area;
        subareaCtrl.text = pemiluData.subarea;
        votersAllCtrl.text = pemiluData.votersAll.toString();
        votersTargetCtrl.text = pemiluData.votersTarget.toString();
        update();
      } else {
        loadingPemilu = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingPemilu = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionUpdate() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "category": categoryCtrl.text.toString(),
        "area": areaCtrl.text.toString(),
        "subarea": subareaCtrl.text.toString(),
        "voters_all": votersAllCtrl.text.toString(),
        "voters_target": votersTargetCtrl.text.toString(),
      };

      // ignore: unused_local_variable
      var (res, data, msg, page) = await pemiluAPI.update(session.electionId, body);
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
