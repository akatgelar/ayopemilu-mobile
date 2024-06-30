import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_add/inventaris_add_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class InventarisAddPage extends StatefulWidget {
  const InventarisAddPage({super.key});

  @override
  State<InventarisAddPage> createState() => _InventarisAddPageState();
}

class _InventarisAddPageState extends State<InventarisAddPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventarisAddController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.inventarisId == '0' ? headerMenu(true, false, "Tambah Inventaris") : headerMenu(true, false, "Edit Inventaris"),
                controller.loadingInventaris
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(20),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Inventaris",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Bendera partai"),
                                  controller: controller.titleCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jumlah",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: xx"),
                                  keyboardType: TextInputType.number,
                                  controller: controller.amountCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Unit",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Pcs"),
                                  controller: controller.unitCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Harga Total",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: 200.000"),
                                  keyboardType: TextInputType.number,
                                  controller: controller.priceCtrl,
                                ),
                              ],
                            ),
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
                                    child: controller.inventarisId == '0'
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
                                                : Image.network("$apiBaseUrl/uploads/thumb/${controller.inventarisData.picture}"),
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
                                  decoration: styleFormInput("contoh: Untuk dipasang di daerah xxx"),
                                  minLines: 3,
                                  maxLines: null,
                                  controller: controller.descriptionCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: styleFormButtonGreen(context, 50),
                              onPressed: () {
                                if (controller.inventarisId == '0') {
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
