// card Pemilih
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

Container buttonAdd(context, String buttonText, String buttonRoute) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
    child: ElevatedButton(
      style: styleFormButton(context, 50),
      onPressed: () {
        Get.toNamed(buttonRoute);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.plus),
          const SizedBox(width: 5),
          Text(
            buttonText,
            style: const TextStyle(
              color: ThemeColor.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
