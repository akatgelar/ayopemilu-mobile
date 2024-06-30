import 'package:ayopemilu_mobile/data/apis/pengeluran_api.dart';
import 'package:ayopemilu_mobile/data/models/pengeluaran_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PengeluaranController extends GetxController {
  int _page = 0;
  bool loadingPengeluaran = true;
  ScrollController scrollController = ScrollController();
  final pengeluaranSearchCtrl = TextEditingController();
  final numberRibuan = NumberFormat.decimalPattern("id_ID");

  PengeluaranAPI pengeluaranAPI = PengeluaranAPI();
  List<PengeluaranModel> pengeluaranData = [];

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
          await pengeluaranAPI.getAll("{'election_id':'${session.electionId}'}", "id:desc", 10, _page, pengeluaranSearchCtrl.text.toString());
      if (res) {
        loadingPengeluaran = false;
        for (var dat in data) {
          pengeluaranData.add(PengeluaranModel.fromMap(dat));
        }
        update();
      } else {
        loadingPengeluaran = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingPengeluaran = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionSearch() async {
    _page = 0;
    pengeluaranData = [];
    loadingPengeluaran = true;
    update();
    await getData();
  }

  removeDataIndex(id) {
    int i = 0;
    for (var data in pengeluaranData) {
      if (data.id == int.parse(id)) {
        pengeluaranData.removeAt(i);
        update();
      }
      i += 1;
    }
  }

  insertDataIndex(index, data) {
    pengeluaranData.insert(index, data);
    update();
  }

  updateDataIndex(id, data) {
    int i = 0;
    for (var data in pengeluaranData) {
      if (data.id == int.parse(id)) {
        pengeluaranData[i] = data;
        update();
        actionSearch();
      }
      i += 1;
    }
  }
}
