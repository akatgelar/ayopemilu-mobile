import 'package:ayopemilu_mobile/data/apis/inventaris_api.dart';
import 'package:ayopemilu_mobile/data/models/inventaris_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InventarisController extends GetxController {
  int _page = 0;
  bool loadingInventaris = true;
  ScrollController scrollController = ScrollController();
  final inventarisSearchCtrl = TextEditingController();
  final numberRibuan = NumberFormat.decimalPattern("id_ID");

  InventarisAPI inventarisAPI = InventarisAPI();
  List<InventarisModel> inventarisData = [];

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
          await inventarisAPI.getAll("{'election_id':'${session.electionId}'}", "id:desc", 10, _page, inventarisSearchCtrl.text.toString());
      if (res) {
        loadingInventaris = false;
        for (var dat in data) {
          inventarisData.add(InventarisModel.fromMap(dat));
        }
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

  actionSearch() async {
    _page = 0;
    inventarisData = [];
    loadingInventaris = true;
    update();
    await getData();
  }

  removeDataIndex(id) {
    int i = 0;
    for (var data in inventarisData) {
      if (data.id == int.parse(id)) {
        inventarisData.removeAt(i);
        update();
      }
      i += 1;
    }
  }

  insertDataIndex(index, data) {
    inventarisData.insert(index, data);
    update();
  }

  updateDataIndex(id, data) {
    int i = 0;
    for (var data in inventarisData) {
      if (data.id == int.parse(id)) {
        inventarisData[i] = data;
        update();
        actionSearch();
      }
      i += 1;
    }
  }
}
