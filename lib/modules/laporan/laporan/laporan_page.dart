import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan/laporan_card.dart';
import 'package:ayopemilu_mobile/modules/shared/bottom_menu.dart';
import 'package:ayopemilu_mobile/modules/shared/button_add.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan/laporan_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaporanController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(false, false, "Laporan"),
                TabBar(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  unselectedLabelColor: ThemeColor.primary,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColor.primary,
                  ),
                  tabs: <Tab>[
                    Tab(
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Semua"),
                        ),
                      ),
                    ),
                    Tab(
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Baru"),
                        ),
                      ),
                    ),
                    Tab(
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Proses"),
                        ),
                      ),
                    ),
                    Tab(
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Selesai"),
                        ),
                      ),
                    ),
                  ],
                  controller: tabController,
                  onTap: (int index) async {
                    tabController.animateTo(index);
                    controller.selectedIndex = index;
                    controller.changeTab();
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: styleFormInputSearch("Pencarian Relawan"),
                    controller: controller.laporanSearchCtrl,
                    onSubmitted: (value) {
                      controller.actionSearch();
                    },
                  ),
                ),
                controller.loadingLaporan
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: controller.laporanData.length,
                          itemBuilder: (context, index) {
                            return laporanCard(
                              controller.laporanData[index].id,
                              controller.laporanData[index].status,
                              controller.laporanData[index].title,
                              controller.laporanData[index].description,
                              dateIndo(controller.laporanData[index].createdAt),
                              controller.laporanData[index].createdName,
                            );
                          },
                          controller: controller.scrollController,
                        ),
                      ),
                buttonAdd(context, 'Tambah Laporan', AppRoutes.laporanAdd)
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomMenu(context, 2, controller.session.roleId),
      ),
    );
  }
}
