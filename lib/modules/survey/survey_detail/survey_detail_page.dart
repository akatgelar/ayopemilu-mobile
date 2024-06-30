import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_detail/survey_detail_list.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_detail/survey_detail_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class SurveyDetailPage extends StatefulWidget {
  const SurveyDetailPage({super.key});

  @override
  State<SurveyDetailPage> createState() => _SurveyDetailPageState();
}

class _SurveyDetailPageState extends State<SurveyDetailPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SurveyDetailController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [headerMenu(true, false, "Detail Survey"), Expanded(child: surveyDetailList(context))],
            ),
          ),
        ),
      ),
    );
  }
}
