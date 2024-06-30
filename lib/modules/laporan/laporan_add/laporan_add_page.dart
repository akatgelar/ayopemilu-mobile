import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_add/laporan_add_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class LaporanAddPage extends StatefulWidget {
  const LaporanAddPage({super.key});

  @override
  State<LaporanAddPage> createState() => _LaporanAddPageState();
}

class _LaporanAddPageState extends State<LaporanAddPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaporanAddController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.laporanId == '0' ? headerMenu(true, false, "Tambah Laporan") : headerMenu(true, false, "Edit Laporan"),
                controller.loadingLaporan
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Judul Laporan",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Laporan kecurangan"),
                                  controller: controller.titleCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            controller.session.roleId == 2
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status Laporan",
                                        style: styleTextNormalBlack(),
                                      ),
                                      const SizedBox(height: 10),
                                      DropdownButtonFormField(
                                        value: controller.statusCtrl.text,
                                        decoration: styleFormInput("contoh: Baru"),
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        isExpanded: true,
                                        items: <String>[
                                          'Baru',
                                          'Proses',
                                          'Selesai',
                                        ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(fontSize: 14),
                                              ),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          controller.statusCtrl.text = value.toString();
                                        },
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Foto ",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.pickFiles();
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: ThemeColor.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text("Upload Foto"),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: SizedBox(
                                    height: 200.00,
                                    width: 200.00,
                                    child: controller.laporanId == '0'
                                        // add
                                        ? SizedBox(
                                            height: 200.00,
                                            width: 200.00,
                                            child: controller.paths != null
                                                ? Image.memory(controller.paths!.first.bytes!)
                                                : Image.asset('assets/images/thumbnail.png'),
                                          )
                                        // edit
                                        : SizedBox(
                                            height: 200.00,
                                            width: 200.00,
                                            child: controller.paths != null
                                                ? Image.memory(controller.paths!.first.bytes!)
                                                : Image.network("$apiBaseUrl/uploads/thumb/${controller.laporanData.picture}"),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Deskripsi",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Terjadi di daerah xx pada "),
                                  minLines: 3,
                                  maxLines: null,
                                  controller: controller.descriptionCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            controller.session.roleId == 2
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Feedback / Tindak Lanjut",
                                        style: styleTextNormalBlack(),
                                      ),
                                      const SizedBox(height: 10),
                                      TextField(
                                        decoration: styleFormInput("contoh: Akan ditindak lanjuti dengan xxx"),
                                        minLines: 3,
                                        maxLines: null,
                                        controller: controller.feedbackCtrl,
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              style: styleFormButtonGreen(context, 50),
                              onPressed: () {
                                if (controller.laporanId == '0') {
                                  controller.actionInsert();
                                } else {
                                  controller.actionUpdate();
                                }
                              },
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(CupertinoIcons.floppy_disk),
                                  SizedBox(width: 5),
                                  Text(
                                    "Simpan",
                                    style: TextStyle(
                                      color: ThemeColor.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
