// card Pemilih
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:get/get.dart';

Container surveyCard(
  String cardDate,
  String cardJudul,
  String cardKategori,
  String cardAktif,
  bool cardStatus,
) {
  return Container(
    child: cardStatus
        ? Card(
            color: ThemeColor.white,
            child: InkWell(
              onTap: () {
                Get.toNamed('${AppRoutes.surveyDetail}?id=xx');
              },
              child:
                  surveyContainer(cardDate, cardJudul, cardKategori, cardAktif),
            ),
          )
        : Card(
            color: ThemeColor.greyMedium,
            child: InkWell(
              child:
                  surveyContainer(cardDate, cardJudul, cardKategori, cardAktif),
            ),
          ),
  );
}

Container surveyContainer(
  String cardDate,
  String cardJudul,
  String cardKategori,
  String cardStatus,
) {
  return Container(
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
                  cardDate,
                  style: styleTextNormalGrey(),
                ),
                const SizedBox(height: 3),
                Text(
                  cardJudul,
                  style: styleTextNormalBlack(),
                  maxLines: 3,
                ),
                const SizedBox(height: 3),
                Text(
                  cardKategori,
                  style: styleTextNormalPrimary(),
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
              visible: cardStatus == 'Non Aktif',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeColor.red,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: ThemeColor.red,
                ),
                padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: const Text(
                  'Non Aktif',
                  style: TextStyle(color: ThemeColor.white, fontSize: 11),
                ),
              ),
            ),
            Visibility(
              maintainState: true,
              visible: cardStatus == 'Aktif',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ThemeColor.green,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: ThemeColor.green,
                ),
                padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: const Text(
                  'Aktif',
                  style: TextStyle(color: ThemeColor.white, fontSize: 11),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
