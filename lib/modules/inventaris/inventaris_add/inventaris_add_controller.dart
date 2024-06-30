// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'package:ayopemilu_mobile/data/apis/inventaris_api.dart';
import 'package:ayopemilu_mobile/data/apis/upload_api.dart';
import 'package:ayopemilu_mobile/data/models/inventaris_model.dart';
import 'package:ayopemilu_mobile/data/models/session_model.dart';
import 'package:ayopemilu_mobile/data/models/upload_model.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';
import 'package:ayopemilu_mobile/helpers/session_helper.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris/inventaris_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class InventarisAddController extends GetxController {
  String inventarisId = '0';
  bool loadingInventaris = true;

  InventarisAPI inventarisAPI = InventarisAPI();
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
  InventarisModel inventarisData = InventarisModel(
    id: 0,
    electionId: 0,
    title: '',
    picture: '',
    description: '',
    amount: '',
    unit: '',
    price: '',
    createdAt: '',
  );

  final titleCtrl = TextEditingController(text: '');
  final nominalCtrl = TextEditingController(text: '');
  final pictureCtrl = TextEditingController(text: '');
  final descriptionCtrl = TextEditingController(text: '');
  final amountCtrl = TextEditingController(text: '');
  final unitCtrl = TextEditingController(text: '');
  final priceCtrl = TextEditingController(text: '');

  List<PlatformFile>? paths;

  @override
  void onInit() async {
    super.onInit();

    SessionHelper().checkSesssionPages();
    session = await SessionHelper().getSession();
    update();

    var data = Get.parameters;
    if (data.containsKey('id')) {
      inventarisId = data['id']!;
      await getDetail(data['id']);
      update();
    }

    loadingInventaris = false;
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
      var (res, data, msg, page) = await inventarisAPI.getById(id);
      if (res) {
        loadingInventaris = false;
        inventarisData = InventarisModel.fromMap(data);

        titleCtrl.text = inventarisData.title;
        pictureCtrl.text = inventarisData.picture;
        descriptionCtrl.text = inventarisData.description;
        amountCtrl.text = inventarisData.amount;
        unitCtrl.text = inventarisData.unit;
        priceCtrl.text = inventarisData.price;
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

  actionInsert() async {
    try {
      EasyLoading.show(status: 'Loading...');

      var body = {
        "election_id": session.electionId,
        "title": titleCtrl.text.toString(),
        "picture": pictureCtrl.text.toString(),
        "description": descriptionCtrl.text.toString(),
        "amount": amountCtrl.text.toString(),
        "unit": unitCtrl.text.toString(),
        "price": priceCtrl.text.toString(),
      };
      if (pictureCtrl.text == '') {
        body['picture'] = 'none.png';
      }

      // ignore: unused_local_variable
      var (res, data, msg, page) = await inventarisAPI.insert(body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();

        InventarisModel inventaris = InventarisModel.fromMap(data);
        final InventarisController listController = Get.find();
        listController.insertDataIndex(0, inventaris);
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
        "picture": pictureCtrl.text.toString(),
        "description": descriptionCtrl.text.toString(),
        "amount": amountCtrl.text.toString(),
        "unit": unitCtrl.text.toString(),
        "price": priceCtrl.text.toString(),
      };

      // ignore: unused_local_variable
      var (res, data, msg, page) = await inventarisAPI.update(inventarisId, body);
      if (res) {
        EasyLoading.dismiss();
        update();
        Get.back();
        Get.back();

        InventarisModel inventaris = InventarisModel.fromMap(data);
        final InventarisController listController = Get.find();
        listController.updateDataIndex(inventarisId, inventaris);
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
