import 'package:ayopemilu_mobile/modules/shared/bottom_menu.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:ayopemilu_mobile/modules/survey/survey/survey_list.dart';
import 'package:ayopemilu_mobile/modules/survey/survey/survey_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(false, false, "Survey"),
                const SizedBox(height: 50),
                Center(
                    child: Image.asset(
                  'assets/images/wip.png',
                  width: 200,
                )),
                const SizedBox(height: 10),
                const Center(child: Text("Fitur masih dalam tahap pengembangan")),
                // Expanded(child: surveyList(context)),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomMenu(context, 4, controller.session.roleId),
      ),
    );
  }
}
