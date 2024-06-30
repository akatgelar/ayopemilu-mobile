// card Pemilih
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';

Container surveyDetailCard(String cardDate, String cardNarasumber) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: ThemeColor.grey,
        width: 1,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardDate,
                  style: styleTextNormalGrey(),
                ),
                const SizedBox(height: 3),
                Text(
                  cardNarasumber,
                  style: styleTextNormalBlack(),
                  maxLines: 3,
                ),
                const SizedBox(height: 3),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
