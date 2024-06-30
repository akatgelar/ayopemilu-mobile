// card Survey
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/modules/survey/survey/survey_card.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';

Column surveyList(context) {
  return Column(
    children: [
      Expanded(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              decoration: styleFormInputSearch("Pencarian Survey"),
            ),
            const SizedBox(height: 10),
            surveyCard(
              "1 Juni 2023 12:34",
              "Survey Elektabilitas Calon",
              "Form Inputan ",
              "Aktif",
              true,
            ),
            surveyCard(
              "1 Juni 2023 12:34",
              "Survey Elektabilitas Calon",
              "Form Inputan ",
              "Aktif",
              true,
            ),
            surveyCard(
              "1 Juni 2023 12:34",
              "Survey Elektabilitas Calon",
              "Form Inputan ",
              "Aktif",
              true,
            ),
            surveyCard(
              "1 Juni 2023 12:34",
              "Survey Elektabilitas Calon",
              "Form Inputan ",
              "Non Aktif",
              false,
            ),
            surveyCard(
              "1 Juni 2023 12:34",
              "Survey Elektabilitas Calon",
              "Form Inputan ",
              "Non Aktif",
              false,
            ),
            surveyCard(
              "1 Juni 2023 12:34",
              "Survey Elektabilitas Calon",
              "Form Inputan ",
              "Non Aktif",
              false,
            ),
          ],
        ),
      ),
    ],
  );
}
