import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_add/survey_add_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/helpers/alert_helper.dart';

class SurveyAddPage extends StatefulWidget {
  const SurveyAddPage({super.key});

  @override
  State<SurveyAddPage> createState() => _SurveyAddPageState();
}

class _SurveyAddPageState extends State<SurveyAddPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyAddController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Isi Survey"),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Text(
                        "Survey perkenalan ke masyarakat",
                        style: styleTitle(),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Narasumber",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: styleFormInput("contoh: Budi Sudarsono"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mengetahui calon X",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: styleFormInput("contoh: Ya"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: <String>[
                              'Ya',
                              'Tidak',
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
                            "Skala mengenal",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField(
                            decoration: styleFormInput("contoh: Sangat kenal"),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            items: <String>[
                              'Sangat kenal',
                              'Cukup kenal',
                              'Kurang kenal',
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
                            "Deskripsi",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: styleFormInput("contoh: Terjadi di daerah xx pada "),
                            minLines: 3,
                            maxLines: null,
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
