import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/modules/shared/divider_list.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran_detail/pengeluaran_detail_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class PengeluaranDetailPage extends StatefulWidget {
  const PengeluaranDetailPage({super.key});

  @override
  State<PengeluaranDetailPage> createState() => _PengeluaranDetailPageState();
}

class _PengeluaranDetailPageState extends State<PengeluaranDetailPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PengeluaranDetailController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Detail Pengeluaran"),
                controller.loadingPengeluaran
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
                                  "Nama Pengeluaran",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pengeluaranData.title,
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
                                  "Nilai",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Rp. ${controller.numberRibuan.format(int.parse(controller.pengeluaranData.nominal))}',
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
                                  "Foto ",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: SizedBox(
                                    height: 200.00,
                                    width: 200.00,
                                    child: Image.network("$apiBaseUrl/uploads/thumb/${controller.pengeluaranData.picture}"),
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
                                  controller.pengeluaranData.description,
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
                                  "Tanggal Pengeluaran",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dateIndo(controller.pengeluaranData.createdAt),
                                  style: styleFormLabel(),
                                ),
                              ],
                            ),
                            dividerList(),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: styleFormButtonOrange(context, 50),
                                    onPressed: () {
                                      Get.toNamed('${AppRoutes.pengeluaranAdd}?id=${controller.pengeluaranId}&mode=edit');
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
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: styleFormButtonRed(context, 50),
                                    onPressed: () {
                                      controller.alertConfirm(context, controller.pengeluaranId);
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
