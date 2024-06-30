import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/modules/shared/divider_list.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_detail/inventaris_detail_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class InventarisDetailPage extends StatefulWidget {
  const InventarisDetailPage({super.key});

  @override
  State<InventarisDetailPage> createState() => _InventarisDetailPageState();
}

class _InventarisDetailPageState extends State<InventarisDetailPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventarisDetailController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Detail Inventaris"),
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
                                Text(
                                  controller.inventarisData.title,
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
                                  "Jumlah - Unit",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${controller.inventarisData.amount} ${controller.inventarisData.unit}',
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
                                  "Harga Total",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Rp. ${controller.numberRibuan.format(int.parse(controller.inventarisData.price))}',
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
                                    child: Image.network("$apiBaseUrl/uploads/thumb/${controller.inventarisData.picture}"),
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
                                  controller.inventarisData.description,
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
                                  "Tanggal Inventaris",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dateIndo(controller.inventarisData.createdAt),
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
                                      Get.toNamed('${AppRoutes.inventarisAdd}?id=${controller.inventarisId}&mode=edit');
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
                                      controller.alertConfirm(context, controller.inventarisId);
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
