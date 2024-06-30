// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/laporan_api.dart';
import 'package:ayopemilu_mobile/data/apis/upload_api.dart';
import 'package:ayopemilu_mobile/data/models/laporan_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/data/models/upload_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan/laporan_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LaporanAddController extends GetxController {
  String laporanId = '0';
  bool loadingLaporan = true;

  LaporanAPI laporanAPI = LaporanAPI();
  UploadAPI uploadAPI = UploadAPI();

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

  final titleCtrl = TextEditingController(text: '');
  final pictureCtrl = TextEditingController(text: '');
  final descriptionCtrl = TextEditingController(text: '');
  final feedbackCtrl = TextEditingController(text: '');
  final statusCtrl = TextEditingController(text: '');

  List<PlatformFile>? paths;

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
      update();
    }

    loadingLaporan = false;
    update();
  }

  pickFiles() async {
    try {
      paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        withData: true,
        allowMultiple: false,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
      ))
          ?.files;
      update();
      if (paths != null) {
        if (paths != null) {
          // ignore: unused_local_variable
          var (res, data, msg) = await uploadAPI.uploadFile(paths!.first.bytes!, paths!.first.name);
          if (res) {
            UploadModel upload = UploadModel.fromMap(data);
            pictureCtrl.text = upload.fileName;
            update();
          }
        }
      }
    } on PlatformException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  getDetail(id) async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await laporanAPI.getById(id);
      if (res) {
        loadingLaporan = false;
        laporanData = LaporanModel.fromMap(data);

        titleCtrl.text = laporanData.title;
        descriptionCtrl.text = laporanData.description;
        feedbackCtrl.text = laporanData.feedback;
        statusCtrl.text = laporanData.status;
        pictureCtrl.text = laporanData.picture;
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

  actionInsert() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "election_id": session.electionId,
        "title": titleCtrl.text.toString(),
        "description": descriptionCtrl.text.toString(),
        "feedback": feedbackCtrl.text.toString(),
        "status": statusCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
      };
      if (statusCtrl.text == '') {
        body['status'] = 'Baru';
      }
      if (pictureCtrl.text == '') {
        body['picture'] = 'none.png';
      }

      // ignore: unused_local_variable
      var (res, data, msg, page) = await laporanAPI.insert(body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        LaporanModel laporan = LaporanModel.fromMap(data);
        final LaporanController listController = Get.find();
        listController.insertDataIndex(0, laporan);
      } else {
        EasyLoading.dismiss();
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      EasyLoading.dismiss();
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionUpdate() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "election_id": session.electionId,
        "title": titleCtrl.text.toString(),
        "description": descriptionCtrl.text.toString(),
        "feedback": feedbackCtrl.text.toString(),
        "status": statusCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
      };

      // ignore: unused_local_variable
      var (res, data, msg, page) = await laporanAPI.update(laporanId, body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();
        Get.back();

        LaporanModel laporan = LaporanModel.fromMap(data);
        final LaporanController listController = Get.find();
        listController.updateDataIndex(laporanId, laporan);
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
