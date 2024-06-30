import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/modules/shared/divider_list.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_detail/pemilih_detail_controller.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class PemilihDetailPage extends StatefulWidget {
  const PemilihDetailPage({super.key});

  @override
  State<PemilihDetailPage> createState() => _PemilihDetailPageState();
}

class _PemilihDetailPageState extends State<PemilihDetailPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PemilihDetailController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Detail Calon Pemilih"),
                controller.loadingPemilih
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
                                  "Nama Lengkap",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.name,
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
                                  "Jenis Kelamin",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.gender,
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
                                  "Tanggal Lahir",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dateIndo(controller.pemilihData.bod),
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
                                  "Agama",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.religion,
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
                                  "No KTP",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.nik,
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
                                  "No Handphone",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.phone,
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
                                  "Provinsi",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.provinsiNama,
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
                                  "Kota / Kabupaten",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.kotaNama,
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
                                  "Kecamatan",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.kecamatanNama,
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
                                  "Kelurahan / Desa",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.kelurahanNama,
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
                                  "Alamat Lengkap",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.address,
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
                                    child: Image.network("$assetBaseUrl/thumb/${controller.pemilihData.picture}"),
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
                                  "Catatan",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.notes,
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
                                  "Dibuat oleh",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  controller.pemilihData.createdName,
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
                                  "Dibuat pada",
                                  style: styleTextNormalBlack(),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  dateIndo(controller.pemilihData.createdAt),
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
                                      Get.toNamed('${AppRoutes.pemilihAdd}?id=${controller.pemilihId}&mode=edit');
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
                                      controller.alertConfirm(context, controller.pemilihId);
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
