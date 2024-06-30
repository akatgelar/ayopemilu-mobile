// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Card relawanCard(
  int cardId,
  String cardFoto,
  String cardNama,
  String cardUsia,
  String cardPhone,
  String cardEmail,
  String cardCreatedName,
  String cardCreatedAt,
) {
  return Card(
    color: ThemeColor.white,
    elevation: 0,
    child: InkWell(
      onTap: () {
        Get.toNamed('${AppRoutes.relawanDetail}?id=$cardId');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            margin: const EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage('$apiBaseUrl/uploads/thumb/$cardFoto'),
              backgroundColor: ThemeColor.white,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$cardNama ($cardUsia)',
                    style: styleTextNormalPrimary(),
                  ),
                  Text(
                    cardEmail,
                    style: styleTextNormalBlack(),
                    maxLines: 3,
                    softWrap: true,
                  ),
                  Text(
                    cardPhone,
                    style: styleTextNormalBlack(),
                    maxLines: 3,
                    softWrap: true,
                  ),
                  Text(
                    'Oleh : $cardCreatedName, Pada : $cardCreatedAt',
                    style: styleTextNormalGrey(),
                    maxLines: 3,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(5),
              child: const Icon(CupertinoIcons.phone),
            ),
            onTap: () async {
              var url = "tel:+62${cardPhone.substring(1)}";
              html.window.open(url, '');
            },
          ),
          InkWell(
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(5),
              child: const Icon(CupertinoIcons.chat_bubble),
            ),
            onTap: () async {
              var url = "https://wa.me/62${cardPhone.substring(1)}/?text=Pesan dari aplikasi Ayo Pemilu: ";
              html.window.open(url, '');
            },
          ),
        ],
      ),
    ),
  );
}

encencodeQueryParameters(Map<String, String> params) {
  return params.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
}
