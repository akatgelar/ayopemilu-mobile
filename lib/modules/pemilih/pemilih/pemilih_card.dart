// card Pemilih
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Card pemilihCard(
  int cardId,
  String cardFoto,
  String cardNama,
  String cardUsia,
  String cardWilayah,
  String cardCreatedName,
  String cardCreatedAt,
) {
  return Card(
    color: ThemeColor.white,
    elevation: 0,
    child: InkWell(
      onTap: () {
        Get.toNamed('${AppRoutes.pemilihDetail}?id=$cardId');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage('$apiBaseUrl/uploads/thumb/$cardFoto'),
                backgroundColor: ThemeColor.white,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$cardNama ($cardUsia)',
                    style: styleTextNormalPrimary(),
                  ),
                  Text(
                    cardWilayah.capitalize!,
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
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Icon(CupertinoIcons.chevron_right),
            ),
          ),
        ],
      ),
    ),
  );
}
