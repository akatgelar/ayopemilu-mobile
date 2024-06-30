// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:developer';
import 'package:ayopemilu_mobile/data/apis/relawan_api.dart';
import 'package:ayopemilu_mobile/data/apis/upload_api.dart';
import 'package:ayopemilu_mobile/data/models/relawan_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/data/models/upload_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan/relawan_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RelawanAddController extends GetxController {
  String relawanId = '0';
  bool loadingRelawan = true;

  RelawanAPI relawanAPI = RelawanAPI();
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
  RelawanModel relawanData = RelawanModel(
    id: 0,
    name: '',
    email: '',
    gender: '',
    bod: '',
    phone: '',
    address: '',
    picture: 'none.png',
    expiredDate: '',
    notes: '',
    createdName: '',
    createdAt: '',
  );

  final nameCtrl = TextEditingController(text: '');
  final emailCtrl = TextEditingController(text: '');
  final passwordCtrl = TextEditingController(text: '');
  final genderCtrl = TextEditingController(text: '');
  final bodCtrl = TextEditingController(text: '');
  final phoneCtrl = TextEditingController(text: '');
  final addressCtrl = TextEditingController(text: '');
  final pictureCtrl = TextEditingController(text: '');
  final notesCtrl = TextEditingController(text: '');

  List<PlatformFile>? paths;

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      relawanId = data['id']!;
      await getDetail(data['id']);
      update();
    }

    loadingRelawan = false;
    update();
  }

  pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      bodCtrl.text = formattedDate;
      update();
    } else {
      log("Date is not selected");
    }
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
      var (res, data, msg, page) = await relawanAPI.getById(id);
      if (res) {
        loadingRelawan = false;
        relawanData = RelawanModel.fromMap(data);

        nameCtrl.text = relawanData.name;
        emailCtrl.text = relawanData.email;
        genderCtrl.text = relawanData.gender;
        bodCtrl.text = relawanData.bod;
        phoneCtrl.text = relawanData.phone;
        addressCtrl.text = relawanData.address;
        pictureCtrl.text = relawanData.picture;
        notesCtrl.text = relawanData.notes;
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

  actionInsert() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "election_id": session.electionId,
        "role_id": 3,
        "name": nameCtrl.text.toString(),
        "email": emailCtrl.text.toString(),
        "password": passwordCtrl.text.toString(),
        "gender": genderCtrl.text.toString(),
        "bod": bodCtrl.text.toString(),
        "phone": phoneCtrl.text.toString(),
        "address": addressCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
        "notes": notesCtrl.text.toString(),
      };
      if (pictureCtrl.text == '') {
        body['picture'] = 'none.png';
      }

      // ignore: unused_local_variable
      var (res, data, msg, page) = await relawanAPI.insert(body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        RelawanModel relawan = RelawanModel.fromMap(data);
        final RelawanController listController = Get.find();
        listController.insertDataIndex(0, relawan);
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
        "role_id": 3,
        "name": nameCtrl.text.toString(),
        "email": emailCtrl.text.toString(),
        "password": passwordCtrl.text.toString(),
        "gender": genderCtrl.text.toString(),
        "bod": bodCtrl.text.toString(),
        "phone": phoneCtrl.text.toString(),
        "address": addressCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
        "notes": notesCtrl.text.toString(),
      };
      if (passwordCtrl.text == '') {
        body.remove('password');
      }

      // ignore: unused_local_variable
      var (res, data, msg, page) = await relawanAPI.update(relawanId, body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();
        Get.back();

        RelawanModel relawan = RelawanModel.fromMap(data);
        final RelawanController listController = Get.find();
        listController.updateDataIndex(relawanId, relawan);
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
