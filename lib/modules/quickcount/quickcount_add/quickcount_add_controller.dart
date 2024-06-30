// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuickcountAddController extends GetxController {
  List<PlatformFile>? paths;
  bool statusFile = false;
  late TextEditingController dateinput = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    print(data);
  }

  void pickFiles() async {
    try {
      paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        // onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
      ))
          ?.files;
      statusFile = true;
    } on PlatformException catch (e) {
      log('Unsupported operation$e');
      statusFile = false;
    } catch (e) {
      log(e.toString());
      statusFile = false;
    }
    update();
  }

  void pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateinput.text = formattedDate;
      update();
    } else {
      log("Date is not selected");
    }
  }
}
