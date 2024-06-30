import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_password/setting_password_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class SettingPasswordPage extends StatefulWidget {
  const SettingPasswordPage({super.key});

  @override
  State<SettingPasswordPage> createState() => _SettingPasswordPageState();
}

class _SettingPasswordPageState extends State<SettingPasswordPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingPasswordController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Edit Password"),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password Lama",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            obscureText: true,
                            decoration: styleFormInput("contoh: xxxxxx"),
                            controller: controller.passwordOldCtrl,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password Baru",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          TextField(obscureText: true, decoration: styleFormInput("contoh: xxxxxx"), controller: controller.passwordNewCtrl),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ulangi Password Baru",
                            style: styleTextNormalBlack(),
                          ),
                          const SizedBox(height: 10),
                          TextField(obscureText: true, decoration: styleFormInput("contoh: xxxxxx"), controller: controller.passwordNewAgainCtrl),
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
