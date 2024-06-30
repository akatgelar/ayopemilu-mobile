import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih/pemilih_card.dart';
import 'package:ayopemilu_mobile/modules/shared/bottom_menu.dart';
import 'package:ayopemilu_mobile/modules/shared/button_add.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih/pemilih_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class PemilihPage extends StatefulWidget {
  const PemilihPage({super.key});

  @override
  State<PemilihPage> createState() => _PemilihPageState();
}

class _PemilihPageState extends State<PemilihPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PemilihController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(false, false, "Calon Pemilih"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: styleFormInputSearch("Pencarian Relawan"),
                    controller: controller.pemilihSearchCtrl,
                    onSubmitted: (value) {
                      controller.actionSearch();
                    },
                  ),
                ),
                controller.loadingPemilih
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: controller.pemilihData.length,
                          itemBuilder: (context, index) {
                            return pemilihCard(
                              controller.pemilihData[index].id,
                              controller.pemilihData[index].picture,
                              controller.pemilihData[index].name,
                              '${countAge(controller.pemilihData[index].bod)} tahun',
                              '${controller.pemilihData[index].provinsiNama}, ${controller.pemilihData[index].kotaNama}, ${controller.pemilihData[index].kecamatanNama}, ${controller.pemilihData[index].kelurahanNama}',
                              controller.pemilihData[index].createdName,
                              dateIndo(controller.pemilihData[index].createdAt),
                            );
                          },
                          controller: controller.scrollController,
                        ),
                      ),
                buttonAdd(context, 'Tambah Calon Pemilih', AppRoutes.pemilihAdd)
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomMenu(context, 1, controller.session.roleId),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
