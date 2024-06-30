import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount_add/quickcount_add_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class QuickcountAddPage extends StatefulWidget {
  const QuickcountAddPage({super.key});

  @override
  State<QuickcountAddPage> createState() => _QuickcountAddPageState();
}

class _QuickcountAddPageState extends State<QuickcountAddPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuickcountAddController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Tambah Quick Count"),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Provinsi",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: styleFormInput("contoh: Jawa Barat"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: <String>['item 1', 'item 2'].map<DropdownMenuItem<String>>(
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
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kota / Kabupaten",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: styleFormInput("contoh: Kab Bandung"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: <String>['item 1', 'item 2'].map<DropdownMenuItem<String>>(
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
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kecamatan",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: styleFormInput("contoh: Rancaekek"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: <String>['item 1', 'item 2'].map<DropdownMenuItem<String>>(
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
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kelurahan / Desa",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: styleFormInput("contoh: Bojongloa"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: <String>['item 1', 'item 2'].map<DropdownMenuItem<String>>(
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
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TPS",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: styleFormInput("contoh: TPS 1"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: <String>['item 1', 'item 2'].map<DropdownMenuItem<String>>(
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
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah DPT",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: styleFormInput("contoh: xx.xxx"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah Pemilih Calon",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: styleFormInput("contoh: xxx"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: styleFormButtonGreen(context, 50),
                        onPressed: () {
                          alertSuccess(context, "Data berhasil disimpan");
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
