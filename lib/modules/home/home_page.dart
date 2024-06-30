import 'package:ayopemilu_mobile/modules/shared/bottom_menu.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/modules/home/home_section_caleg.dart';
import 'package:ayopemilu_mobile/modules/home/home_section_welcome.dart';
import 'package:ayopemilu_mobile/modules/home/home_section_countdown.dart';
import 'package:ayopemilu_mobile/modules/home/home_section_statistik.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/home/home_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(false, true, ""),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      // section welcome
                      sectionWelcome(context, controller),
                      const SizedBox(height: 20),
                      // section caleg
                      sectionCaleg(context, controller),
                      const SizedBox(height: 10),
                      // section countdown
                      sectionContdown(context, controller),
                      const SizedBox(height: 20),
                      // section statistik
                      sectionStatistik(context, controller),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomMenu(context, 0, controller.session.roleId),
      ),
    );
  }
}
