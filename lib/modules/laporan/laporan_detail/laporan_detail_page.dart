import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/modules/shared/divider_list.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_detail/laporan_detail_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class LaporanDetailPage extends StatefulWidget {
  const LaporanDetailPage({super.key});

  @override
  State<LaporanDetailPage> createState() => _LaporanDetailPageState();
}

class _LaporanDetailPageState extends State<LaporanDetailPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaporanDetailController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Detail Laporan"),
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
                                Text(
                                  controller.laporanData.title,
                                  style: styleFormLabel(),
                                ),
                              ],
                            ),
                            dividerList(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Status Laporan",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Visibility(
                                  maintainState: true,
                                  visible: controller.laporanData.status == 'Baru',
                                  child: badgeRed('Baru'),
                                ),
                                Visibility(
                                  maintainState: true,
                                  visible: controller.laporanData.status == 'Proses',
                                  child: badgeYellow('Proses'),
                                ),
                                Visibility(
                                  maintainState: true,
                                  visible: controller.laporanData.status == 'Selesai',
                                  child: badgeGreen('Selesai'),
                                ),
                              ],
                            ),
                            dividerList(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Foto ",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: SizedBox(
                                    height: 200.00,
                                    width: 200.00,
                                    child: Image.network("$apiBaseUrl/uploads/thumb/${controller.laporanData.picture}"),
                                  ),
                                ),
                              ],
                            ),
                            dividerList(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Deskripsi",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.laporanData.description,
                                  style: styleFormLabel(),
                                ),
                              ],
                            ),
                            dividerList(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Feedback / Tindak Lanjut",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.laporanData.feedback,
                                  style: styleFormLabel(),
                                ),
                              ],
                            ),
                            dividerList(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tanggal Laporan",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dateIndo(controller.laporanData.createdAt),
                                  style: styleFormLabel(),
                                ),
                              ],
                            ),
                            dividerList(),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: controller.session.roleId == 2
                                        ? ElevatedButton(
                                            style: styleFormButtonOrange(context, 50),
                                            onPressed: () {
                                              Get.toNamed('${AppRoutes.laporanAdd}?id=${controller.laporanId}&mode=edit');
                                            },
                                            child: const Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(CupertinoIcons.pencil),
                                                SizedBox(width: 5),
                                                Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    color: ThemeColor.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox()),
                                const SizedBox(width: 5),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: styleFormButtonRed(context, 50),
                                    onPressed: () {
                                      controller.alertConfirm(context, controller.laporanId);
                                    },
                                    child: const Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(CupertinoIcons.trash),
                                        SizedBox(width: 5),
                                        Text(
                                          "Delete",
                                          style: TextStyle(
                                            color: ThemeColor.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
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
