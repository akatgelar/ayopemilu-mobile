import 'package:ayopemilu_mobile/data/apis/pemilih_api.dart';
import 'package:ayopemilu_mobile/data/models/pemilih_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PemilihController extends GetxController {
  int _page = 0;
  bool loadingPemilih = true;
  ScrollController scrollController = ScrollController();
  final pemilihSearchCtrl = TextEditingController();

  PemilihAPI pemilihAPI = PemilihAPI();
  List<PemilihModel> pemilihData = [];

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

  @override
  onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    await getData();

    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        await getData();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  getData() async {
    try {
      _page += 1;
      // ignore: unused_local_variable
      var (res, data, msg, page) =
          await pemilihAPI.getAll("{'election_id':'${session.electionId}'}", "id:desc", 10, _page, pemilihSearchCtrl.text.toString());
      if (res) {
        loadingPemilih = false;
        for (var dat in data) {
          pemilihData.add(PemilihModel.fromMap(dat));
        }
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

  actionSearch() async {
    _page = 0;
    pemilihData = [];
    loadingPemilih = true;
    update();
    await getData();
  }

  removeDataIndex(id) {
    int i = 0;
    for (var data in pemilihData) {
      if (data.id == int.parse(id)) {
        pemilihData.removeAt(i);
        update();
      }
      i += 1;
    }
  }

  insertDataIndex(index, data) {
    pemilihData.insert(index, data);
    update();
  }

  updateDataIndex(id, data) {
    int i = 0;
    for (var data in pemilihData) {
      if (data.id == int.parse(id)) {
        pemilihData[i] = data;
        update();
        actionSearch();
      }
      i += 1;
    }
  }
}
