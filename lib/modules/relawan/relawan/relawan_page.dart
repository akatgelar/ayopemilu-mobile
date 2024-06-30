import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan/relawan_card.dart';
import 'package:ayopemilu_mobile/modules/shared/button_add.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan/relawan_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class RelawanPage extends StatefulWidget {
  const RelawanPage({super.key});

  @override
  State<RelawanPage> createState() => _RelawanPageState();
}

class _RelawanPageState extends State<RelawanPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RelawanController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Relawan"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: styleFormInputSearch("Pencarian Relawan"),
                    controller: controller.relawanSearchCtrl,
                    onSubmitted: (value) {
                      controller.actionSearch();
                    },
                  ),
                ),
                controller.loadingRelawan
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: controller.relawanData.length,
                          itemBuilder: (context, index) {
                            return relawanCard(
                              controller.relawanData[index].id,
                              controller.relawanData[index].picture,
                              controller.relawanData[index].name,
                              '${countAge(controller.relawanData[index].bod)} tahun',
                              controller.relawanData[index].phone,
                              controller.relawanData[index].email,
                              controller.relawanData[index].createdName,
                              dateIndo(controller.relawanData[index].createdAt),
                            );
                          },
                          controller: controller.scrollController,
                        ),
                      ),
                buttonAdd(context, 'Tambah Relawan', AppRoutes.relawanAdd)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
