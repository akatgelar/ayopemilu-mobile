// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:ayopemilu_mobile/data/apis/pengeluran_api.dart';
import 'package:ayopemilu_mobile/data/apis/upload_api.dart';
import 'package:ayopemilu_mobile/data/models/pengeluaran_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/data/models/upload_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran/pengeluaran_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PengeluaranAddController extends GetxController {
  String pengeluaranId = '0';
  bool loadingPengeluaran = true;

  PengeluaranAPI pengeluaranAPI = PengeluaranAPI();
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
  PengeluaranModel pengeluaranData = PengeluaranModel(
    id: 0,
    electionId: 0,
    title: '',
    nominal: '',
    picture: '',
    description: '',
    createdAt: '',
  );

  final titleCtrl = TextEditingController(text: '');
  final nominalCtrl = TextEditingController(text: '');
  final pictureCtrl = TextEditingController(text: '');
  final descriptionCtrl = TextEditingController(text: '');

  List<PlatformFile>? paths;

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      pengeluaranId = data['id']!;
      await getDetail(data['id']);
      update();
    }

    loadingPengeluaran = false;
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
      var (res, data, msg, page) = await pengeluaranAPI.getById(id);
      if (res) {
        loadingPengeluaran = false;
        pengeluaranData = PengeluaranModel.fromMap(data);

        titleCtrl.text = pengeluaranData.title;
        nominalCtrl.text = pengeluaranData.nominal;
        pictureCtrl.text = pengeluaranData.picture;
        descriptionCtrl.text = pengeluaranData.description;
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

  actionInsert() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "election_id": session.electionId,
        "title": titleCtrl.text.toString(),
        "nominal": nominalCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
        "description": descriptionCtrl.text.toString(),
      };
      if (pictureCtrl.text == '') {
        body['picture'] = 'none.png';
      }

      // ignore: unused_local_variable
      var (res, data, msg, page) = await pengeluaranAPI.insert(body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        PengeluaranModel pengeluaran = PengeluaranModel.fromMap(data);
        final PengeluaranController listController = Get.find();
        listController.insertDataIndex(0, pengeluaran);
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
        "nominal": nominalCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
        "description": descriptionCtrl.text.toString(),
      };

      // ignore: unused_local_variable
      var (res, data, msg, page) = await pengeluaranAPI.update(pengeluaranId, body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();
        Get.back();

        PengeluaranModel pengeluaran = PengeluaranModel.fromMap(data);
        final PengeluaranController listController = Get.find();
        listController.updateDataIndex(pengeluaranId, pengeluaran);
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
