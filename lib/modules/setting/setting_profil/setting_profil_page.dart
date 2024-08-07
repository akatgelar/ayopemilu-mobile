import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_profil/setting_profil_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class SettingProfilPage extends StatefulWidget {
  const SettingProfilPage({super.key});

  @override
  State<SettingProfilPage> createState() => _SettingProfilPageState();
}

class _SettingProfilPageState extends State<SettingProfilPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingProfilController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Edit Profil"),
                controller.loadingUser
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
                                  "Email",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: budisudarsono@gmail.com"),
                                  controller: controller.emailCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama Lengkap",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Budi Sudarsono"),
                                  controller: controller.nameCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jenis Kelamin",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                DropdownButtonFormField(
                                  value: controller.genderCtrl.text.isEmpty ? null : controller.genderCtrl.text,
                                  decoration: styleFormInput("contoh: Laki-laki"),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  isExpanded: true,
                                  items: <String>['Laki-laki', 'Perempuan'].map<DropdownMenuItem<String>>(
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
                                    controller.genderCtrl.text = value.toString();
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tanggal Lahir",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                    controller: controller.bodCtrl,
                                    decoration: styleFormInput("contoh: 1990-12-31"),
                                    keyboardType: TextInputType.datetime,
                                    onTap: () async {
                                      controller.pickDate(context);
                                    }),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "No Handphone",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: 081xxxxxx"),
                                  keyboardType: TextInputType.phone,
                                  controller: controller.phoneCtrl,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Alamat Lengkap",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: styleFormInput("contoh: Jalan xxx No xx"),
                                  minLines: 4,
                                  maxLines: null,
                                  controller: controller.addressCtrl,
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
                                    child: controller.userData.id == 0
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
                                                : Image.network("$assetBaseUrl/thumb/${controller.userData.picture}"),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              style: styleFormButtonGreen(context, 50),
                              onPressed: () {
                                controller.actionUpdate();
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
