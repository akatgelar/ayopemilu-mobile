import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:ayopemilu_mobile/modules/quickcount/quickcount/quickcount_list_quickcount.dart';
// import 'package:ayopemilu_mobile/modules/quickcount/quickcount/quickcount_list_statistik.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount/quickcount_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class QuickcountPage extends StatefulWidget {
  const QuickcountPage({super.key});

  @override
  State<QuickcountPage> createState() => _QuickcountPageState();
}

class _QuickcountPageState extends State<QuickcountPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuickcountController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Quick Count"),
                const SizedBox(height: 50),
                Center(
                    child: Image.asset(
                  'assets/images/wip.png',
                  width: 200,
                )),
                const SizedBox(height: 10),
                const Center(child: Text("Fitur masih dalam tahap pengembangan"))
                // TabBar(
                //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                // dividerColor: Colors.transparent,
                //   unselectedLabelColor: ThemeColor.primary,
                //   indicator: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: ThemeColor.primary,
                //   ),
                //   tabs: <Tab>[
                //     Tab(
                //       height: 30,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: const Align(
                //           alignment: Alignment.center,
                //           child: Text("List"),
                //         ),
                //       ),
                //     ),
                //     Tab(
                //       height: 30,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: const Align(
                //           alignment: Alignment.center,
                //           child: Text("Hasil"),
                //         ),
                //       ),
                //     ),
                //   ],
                //   controller: tabController,
                //   onTap: (int index) {
                //     setState(() {
                //       controller.selectedIndex = index;
                //       tabController.animateTo(index);
                //     });
                //   },
                // ),
                // const SizedBox(height: 10),
                // Expanded(
                //   child: IndexedStack(
                //     index: controller.selectedIndex,
                //     children: <Widget>[
                //       Visibility(
                //         maintainState: true,
                //         visible: controller.selectedIndex == 0,
                //         child: quickcountListQuickcount(context),
                //       ),
                //       Visibility(maintainState: true, visible: controller.selectedIndex == 1, child: quickcountListStatistik(context)),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
