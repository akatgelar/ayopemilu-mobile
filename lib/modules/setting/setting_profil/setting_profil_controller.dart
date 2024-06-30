// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:developer';
import 'package:ayopemilu_mobile/data/apis/upload_api.dart';
import 'package:ayopemilu_mobile/data/apis/user_api.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/data/models/upload_model.dart';
import 'package:ayopemilu_mobile/data/models/user_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/setting/setting/setting_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SettingProfilController extends GetxController {
  bool loadingUser = true;

  UserAPI userAPI = UserAPI();
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
  UserModel userData = UserModel(
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
  );

  final nameCtrl = TextEditingController(text: '');
  final emailCtrl = TextEditingController(text: '');
  final genderCtrl = TextEditingController(text: '');
  final bodCtrl = TextEditingController(text: '');
  final phoneCtrl = TextEditingController(text: '');
  final addressCtrl = TextEditingController(text: '');
  final pictureCtrl = TextEditingController(text: '');

  List<PlatformFile>? paths;

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();
    await getDetail(session.id);
    update();
    loadingUser = false;
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
      var (res, data, msg, page) = await userAPI.getById(id);
      if (res) {
        loadingUser = false;
        userData = UserModel.fromMap(data);

        nameCtrl.text = userData.name;
        emailCtrl.text = userData.email;
        genderCtrl.text = userData.gender;
        bodCtrl.text = userData.bod;
        phoneCtrl.text = userData.phone;
        addressCtrl.text = userData.address;
        pictureCtrl.text = userData.picture;
        update();
      } else {
        loadingUser = false;
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      loadingUser = false;
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  actionUpdate() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "election_id": userData.electionId,
        "role_id": userData.roleId,
        "name": nameCtrl.text.toString(),
        "email": emailCtrl.text.toString(),
        "gender": genderCtrl.text.toString(),
        "bod": bodCtrl.text.toString(),
        "phone": phoneCtrl.text.toString(),
        "address": addressCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
      };

      // ignore: unused_local_variable
      var (res, data, msg, page) = await userAPI.update(userData.id, body);
      if (res) {
        SessionModel newSession = SessionModel.fromMap({
          'token': session.token,
          'id': data['id'],
          'name': data['name'],
          'email': data['email'],
          'gender': data['gender'] ?? '',
          'bod': data['bod'] ?? '',
          'phone': data['phone'] ?? '',
          'address': data['address'] ?? '',
          'picture': data['picture'] ?? '',
          'expiredDate': data['expired_date'] ?? '',
          'roleId': data['role']['id'] ?? 0,
          'roleName': data['role']['name'] ?? '',
          'electionId': data['election']['id'] ?? 0,
          'electionCategory': data['election']['category'] ?? '',
          'electionArea': data['election']['area'] ?? '',
          'electionSubarea': data['election']['subarea'] ?? '',
          'electionVotersAll': data['election']['voters_all'] ?? 0,
          'electionVotersTarget': data['election']['voters_target'] ?? 0,
          'calegId': data['caleg_id'] ?? 0,
        });
        SessionHelper().setSession(newSession);
        update();

        final SettingController listController = Get.find();
        listController.setSession(newSession);

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
