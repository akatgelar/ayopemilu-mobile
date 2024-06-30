import 'package:ayopemilu_mobile/data/apis/laporan_api.dart';
import 'package:ayopemilu_mobile/data/models/laporan_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanController extends GetxController {
  int selectedIndex = 0;
  int _page = 0;
  bool loadingLaporan = true;
  ScrollController scrollController = ScrollController();
  final laporanSearchCtrl = TextEditingController();

  LaporanAPI laporanAPI = LaporanAPI();
  List<LaporanModel> laporanData = [];

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
      var where = "";
      if (selectedIndex == 0) {
        where = "{'election_id':'${session.electionId}'}";
      } else if (selectedIndex == 1) {
        where = "{'election_id':'${session.electionId}','status':'Baru'}";
      } else if (selectedIndex == 2) {
        where = "{'election_id':'${session.electionId}','status':'Proses'}";
      } else if (selectedIndex == 3) {
        where = "{'election_id':'${session.electionId}','status':'Selesai'}";
      }

      // ignore: unused_local_variable
      var (res, data, msg, page) = await laporanAPI.getAll(where, "id:desc", 10, _page, laporanSearchCtrl.text.toString());
      if (res) {
        loadingLaporan = false;
        for (var dat in data) {
          laporanData.add(LaporanModel.fromMap(dat));
        }
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

  actionSearch() async {
    _page = 0;
    laporanData = [];
    loadingLaporan = true;
    update();
    await getData();
  }

  changeTab() async {
    _page = 0;
    laporanData = [];
    loadingLaporan = true;
    update();
    await getData();
  }

  removeDataIndex(id) {
    int i = 0;
    for (var data in laporanData) {
      if (data.id == int.parse(id)) {
        laporanData.removeAt(i);
        update();
      }
      i += 1;
    }
  }

  insertDataIndex(index, data) {
    laporanData.insert(index, data);
    update();
  }

  updateDataIndex(id, data) {
    int i = 0;
    for (var data in laporanData) {
      if (data.id == int.parse(id)) {
        laporanData[i] = data;
        update();
        actionSearch();
      }
      i += 1;
    }
  }
}
