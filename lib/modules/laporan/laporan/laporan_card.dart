// card Pemilih
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:get/get.dart';

Card laporanCard(
  int cardId,
  String cardStatus,
  String cardJudul,
  String cardDeskripsi,
  String cardCreatedAt,
  String cardCreatedName,
) {
  return Card(
    color: ThemeColor.white,
    child: InkWell(
      onTap: () {
        Get.toNamed('${AppRoutes.laporanDetail}?id=$cardId');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ThemeColor.grey,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(5),
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
                      cardJudul,
                      style: styleTextNormalPrimary(),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '$cardDeskripsi ...',
                      style: styleTextNormalBlack(),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Oleh : $cardCreatedName, Pada : $cardCreatedAt',
                      style: styleTextNormalGrey(),
                    ),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  maintainState: true,
                  visible: cardStatus == 'Baru',
                  child: badgeRed('Baru'),
                ),
                Visibility(
                  maintainState: true,
                  visible: cardStatus == 'Proses',
                  child: badgeYellow('Proses'),
                ),
                Visibility(
                  maintainState: true,
                  visible: cardStatus == 'Selesai',
                  child: badgeGreen('Selesai'),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
