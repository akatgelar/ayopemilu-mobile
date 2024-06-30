import 'package:ayopemilu_mobile/modules/shared/bottom_menu.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/statistik/chart_laporan.dart';
import 'package:ayopemilu_mobile/modules/statistik/chart_pengeluaran.dart';
import 'package:ayopemilu_mobile/modules/statistik/chart_pemilih.dart';
import 'package:ayopemilu_mobile/modules/statistik/statistik_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class StatistikPage extends StatefulWidget {
  const StatistikPage({super.key});

  @override
  State<StatistikPage> createState() => _StatistikPageState();
}

class _StatistikPageState extends State<StatistikPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StatistikController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(false, false, "Statistik"),
                // const SizedBox(height: 50),
                // Center(
                //     child: Image.asset(
                //   'assets/images/wip.png',
                //   width: 200,
                // )),
                // const SizedBox(height: 10),
                // const Center(child: Text("Fitur masih dalam tahap pengembangan")),
                TabBar(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  dividerColor: Colors.transparent,
                  // unselectedLabelColor: ThemeColor.primary,
                  // indicator: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  //   color: ThemeColor.primary,
                  // ),
                  tabs: <Tab>[
                    Tab(
                      height: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Pemilih"),
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
                          child: Text("Laporan"),
                        ),
                      ),
                    ),
                    if (controller.session.roleId == 2)
                      Tab(
                        height: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Keuangan"),
                          ),
                        ),
                      ),
                  ],
                  controller: tabController,
                  onTap: (int index) {
                    setState(() {
                      controller.selectedIndex = index;
                      tabController.animateTo(index);
                    });
                  },
                ),
                // const SizedBox(height: 10),
                Expanded(
                  child: IndexedStack(
                    index: controller.selectedIndex,
                    children: <Widget>[
                      Visibility(
                        maintainState: true,
                        visible: controller.selectedIndex == 0,
                        child: chartPemilih(context, controller),
                      ),
                      Visibility(
                        maintainState: true,
                        visible: controller.selectedIndex == 1,
                        child: chartLaporan(context, controller),
                      ),
                      if (controller.session.roleId == 2)
                        Visibility(
                          maintainState: true,
                          visible: controller.selectedIndex == 2,
                          child: chartPengeluaran(context, controller),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomMenu(context, 3, controller.session.roleId),
      ),
    );
  }
}
