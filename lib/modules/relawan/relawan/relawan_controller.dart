import 'package:ayopemilu_mobile/data/apis/relawan_api.dart';
import 'package:ayopemilu_mobile/data/models/relawan_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelawanController extends GetxController {
  int _page = 0;
  bool loadingRelawan = true;
  ScrollController scrollController = ScrollController();
  final relawanSearchCtrl = TextEditingController();

  RelawanAPI relawanAPI = RelawanAPI();
  List<RelawanModel> relawanData = [];

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
          await relawanAPI.getAll("{'role_id':3,'election_id':'${session.electionId}'}", "id:desc", 10, _page, relawanSearchCtrl.text.toString());
      if (res) {
        loadingRelawan = false;
        for (var dat in data) {
          relawanData.add(RelawanModel.fromMap(dat));
        }
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

  actionSearch() async {
    _page = 0;
    relawanData = [];
    loadingRelawan = true;
    update();
    await getData();
  }

  removeDataIndex(id) {
    int i = 0;
    for (var data in relawanData) {
      if (data.id == int.parse(id)) {
        relawanData.removeAt(i);
        update();
      }
      i += 1;
    }
  }

  insertDataIndex(index, data) {
    relawanData.insert(index, data);
    update();
  }

  updateDataIndex(id, data) {
    int i = 0;
    for (var data in relawanData) {
      if (data.id == int.parse(id)) {
        relawanData[i] = data;
        update();
        actionSearch();
      }
      i += 1;
    }
  }
}
