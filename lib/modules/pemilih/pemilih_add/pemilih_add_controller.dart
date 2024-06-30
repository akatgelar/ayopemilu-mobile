// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:developer';
import 'package:ayopemilu_mobile/data/apis/pemilih_api.dart';
import 'package:ayopemilu_mobile/data/apis/area_provinsi_api.dart';
import 'package:ayopemilu_mobile/data/apis/area_kota_api.dart';
import 'package:ayopemilu_mobile/data/apis/area_kecamatan_api.dart';
import 'package:ayopemilu_mobile/data/apis/area_kelurahan_api.dart';
import 'package:ayopemilu_mobile/data/apis/upload_api.dart';
import 'package:ayopemilu_mobile/data/models/area_provinsi_model.dart';
import 'package:ayopemilu_mobile/data/models/pemilih_model.dart';
import 'package:ayopemilu_mobile/data/models/area_kota_model.dart';
import 'package:ayopemilu_mobile/data/models/area_kecamatan_model.dart';
import 'package:ayopemilu_mobile/data/models/area_kelurahan_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/data/models/upload_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih/pemilih_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PemilihAddController extends GetxController {
  String pemilihId = '0';
  bool loadingPemilih = true;

  PemilihAPI pemilihAPI = PemilihAPI();
  AreaProvinsiAPI provinsiAPI = AreaProvinsiAPI();
  AreaKotaAPI kotaAPI = AreaKotaAPI();
  AreaKecamatanAPI kecamatanAPI = AreaKecamatanAPI();
  AreaKelurahanAPI kelurahanAPI = AreaKelurahanAPI();
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
  PemilihModel pemilihData = PemilihModel(
    id: 0,
    name: '',
    gender: '',
    bod: '',
    religion: '',
    nik: '',
    provinsiKode: '',
    provinsiNama: '',
    kotaKode: '',
    kotaNama: '',
    kecamatanKode: '',
    kecamatanNama: '',
    kelurahanKode: '',
    kelurahanNama: '',
    phone: '',
    address: '',
    picture: 'none.png',
    notes: '',
    createdBy: 0,
    createdName: '',
    createdAt: '',
  );
  List<AreaProvinsiModel> provinsiData = [];
  List<AreaKotaModel> kotaData = [];
  List<AreaKecamatanModel> kecamatanData = [];
  List<AreaKelurahanModel> kelurahanData = [];

  final nameCtrl = TextEditingController(text: '');
  final genderCtrl = TextEditingController(text: '');
  final bodCtrl = TextEditingController(text: '');
  final religionCtrl = TextEditingController(text: '');
  final nikCtrl = TextEditingController(text: '');
  final provinsiKodeCtrl = TextEditingController(text: '');
  final kotaKodeCtrl = TextEditingController(text: '');
  final kecamatanKodeCtrl = TextEditingController(text: '');
  final kelurahanKodeCtrl = TextEditingController(text: '');
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
    await getProvinsi();
    update();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      pemilihId = data['id']!;
      await getDetail(data['id']);
      await getKota(provinsiKodeCtrl.text.toString());
      await getKecamatan(kotaKodeCtrl.text.toString());
      await getKelurahan(kecamatanKodeCtrl.text.toString());
      update();
    }

    loadingPemilih = false;
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

  getProvinsi() async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) = await provinsiAPI.getAll('', 'kemendagri_provinsi_nama:asc', 50, 1, '');
      if (res) {
        for (var dat in data) {
          provinsiData.add(AreaProvinsiModel.fromMap(dat));
        }
        update();
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      EasyLoading.dismiss();
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getKota(provinsiKode) async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) = await kotaAPI.getAll("{'kemendagri_provinsi_kode':'$provinsiKode'}", 'kemendagri_kota_nama:asc', 50, 1, '');
      if (res) {
        kotaData = [];
        for (var dat in data) {
          kotaData.add(AreaKotaModel.fromMap(dat));
        }
        update();
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      EasyLoading.dismiss();
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getKecamatan(kotaKode) async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) = await kecamatanAPI.getAll("{'kemendagri_kota_kode':'$kotaKode'}", 'kemendagri_kecamatan_nama:asc', 50, 1, '');
      if (res) {
        kecamatanData = [];
        for (var dat in data) {
          kecamatanData.add(AreaKecamatanModel.fromMap(dat));
        }
        update();
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      EasyLoading.dismiss();
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getKelurahan(kecamatanKode) async {
    try {
      EasyLoading.show(status: 'Loading...');
      // ignore: unused_local_variable
      var (res, data, msg, page) =
          await kelurahanAPI.getAll("{'kemendagri_kecamatan_kode':'$kecamatanKode'}", 'kemendagri_kelurahan_nama:asc', 50, 1, '');
      if (res) {
        kelurahanData = [];
        for (var dat in data) {
          kelurahanData.add(AreaKelurahanModel.fromMap(dat));
        }
        update();
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        alertFailed(Get.context, msg);
      }
    } catch (err) {
      EasyLoading.dismiss();
      alertFailed(Get.context, 'Internal Error, $err');
    }
  }

  getDetail(id) async {
    try {
      // ignore: unused_local_variable
      var (res, data, msg, page) = await pemilihAPI.getById(id);
      if (res) {
        loadingPemilih = false;
        pemilihData = PemilihModel.fromMap(data);

        nameCtrl.text = pemilihData.name;
        genderCtrl.text = pemilihData.gender;
        bodCtrl.text = pemilihData.bod;
        religionCtrl.text = pemilihData.religion;
        nikCtrl.text = pemilihData.nik;
        provinsiKodeCtrl.text = pemilihData.provinsiKode;
        kotaKodeCtrl.text = pemilihData.kotaKode;
        kecamatanKodeCtrl.text = pemilihData.kecamatanKode;
        kelurahanKodeCtrl.text = pemilihData.kelurahanKode;
        phoneCtrl.text = pemilihData.phone;
        addressCtrl.text = pemilihData.address;
        pictureCtrl.text = pemilihData.picture;
        notesCtrl.text = pemilihData.notes;
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

  actionInsert() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "election_id": session.electionId,
        "name": nameCtrl.text.toString(),
        "gender": genderCtrl.text.toString(),
        "bod": bodCtrl.text.toString(),
        "religion": religionCtrl.text.toString(),
        "nik": nikCtrl.text.toString(),
        "provinsi_kode": provinsiKodeCtrl.text.toString(),
        "kota_kode": kotaKodeCtrl.text.toString(),
        "kecamatan_kode": kecamatanKodeCtrl.text.toString(),
        "kelurahan_kode": kelurahanKodeCtrl.text.toString(),
        "phone": phoneCtrl.text.toString(),
        "address": addressCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
        "notes": notesCtrl.text.toString(),
      };
      if (pictureCtrl.text == '') {
        body['picture'] = 'none.png';
      }

      // ignore: unused_local_variable
      var (res, data, msg, page) = await pemilihAPI.insert(body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        PemilihModel pemilih = PemilihModel.fromMap(data);
        final PemilihController listController = Get.find();
        listController.insertDataIndex(0, pemilih);
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
        "name": nameCtrl.text.toString(),
        "gender": genderCtrl.text.toString(),
        "bod": bodCtrl.text.toString(),
        "religion": religionCtrl.text.toString(),
        "nik": nikCtrl.text.toString(),
        "provinsi_kode": provinsiKodeCtrl.text.toString(),
        "kota_kode": kotaKodeCtrl.text.toString(),
        "kecamatan_kode": kecamatanKodeCtrl.text.toString(),
        "kelurahan_kode": kelurahanKodeCtrl.text.toString(),
        "phone": phoneCtrl.text.toString(),
        "address": addressCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
        "notes": notesCtrl.text.toString(),
      };

      // ignore: unused_local_variable
      var (res, data, msg, page) = await pemilihAPI.update(pemilihId, body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();
        Get.back();

        PemilihModel pemilih = PemilihModel.fromMap(data);
        final PemilihController listController = Get.find();
        listController.updateDataIndex(pemilihId, pemilih);
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
