// card Survey
import 'package:ayopemilu_mobile/modules/shared/button_add.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_detail/survey_detail_card.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';

Column surveyDetailList(context) {
  return Column(
    children: [
      Text(
        "Survey perkenalan ke masyarakat",
        style: styleTitle(),
      ),
      Expanded(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            surveyDetailCard("1 Juni 2023 12:34", "Nama narasumber"),
            surveyDetailCard("1 Juni 2023 12:34", "Nama narasumber"),
            surveyDetailCard("1 Juni 2023 12:34", "Nama narasumber"),
            surveyDetailCard("1 Juni 2023 12:34", "Nama narasumber"),
            surveyDetailCard("1 Juni 2023 12:34", "Nama narasumber"),
            surveyDetailCard("1 Juni 2023 12:34", "Nama narasumber"),
          ],
        ),
      ),
      buttonAdd(context, 'Isi Survey', '${AppRoutes.surveyAdd}?id=xx')
    ],
  );
}
