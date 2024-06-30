import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/setting/setting/setting_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: ListView(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: ThemeColor.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: const Icon(
                                    CupertinoIcons.arrow_left,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Center(
                                  child: Text(
                                    "Setting",
                                    style: styleHeaderWhite(),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.all(5),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage("$assetBaseUrl/thumb/${controller.session.picture}"),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ThemeColor.primary,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: ThemeColor.greylight,
                    ),
                    width: 100,
                    padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
                    margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(CupertinoIcons.checkmark_seal, size: 18),
                        const SizedBox(width: 5),
                        Text(
                          controller.session.roleName,
                          style: const TextStyle(
                            color: ThemeColor.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    controller.session.name,
                    style: styleSubtitle(),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    controller.session.email,
                    style: styleTextNormalBlack(),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  color: Colors.transparent,
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.settingProfil);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: const Icon(CupertinoIcons.pencil),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Edit Profil',
                                  style: styleTextNormalBlack(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(CupertinoIcons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  color: Colors.transparent,
                  elevation: 0,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.settingPassword);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: const Icon(CupertinoIcons.lock),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Edit Password',
                                  style: styleTextNormalBlack(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(CupertinoIcons.chevron_right),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.session.roleId == 2)
                  Card(
                    margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    color: Colors.transparent,
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.settingPemilu);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: const Icon(CupertinoIcons.cube_box),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Setting Pemilu',
                                    style: styleTextNormalBlack(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: const Icon(CupertinoIcons.chevron_right),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                    style: styleFormButton(context, 60),
                    onPressed: () {
                      Get.toNamed(AppRoutes.logout);
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: ThemeColor.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'Version $appVersion',
                    style: TextStyle(
                      color: ThemeColor.grey,
                    ),
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
