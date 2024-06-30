// card Pemilih
import 'package:ayopemilu_mobile/helpers/converter_helper.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:get/get.dart';

Card pengeluaranCard(
  int cardId,
  String cardDate,
  String cardJudul,
  String cardKeterangan,
  String cardNilai,
  controller,
) {
  return Card(
    color: ThemeColor.white,
    child: InkWell(
      onTap: () {
        Get.toNamed('${AppRoutes.pengeluaranDetail}?id=$cardId');
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateIndo(cardDate),
                            style: styleTextNormalPrimary(),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            cardJudul,
                            style: styleTextNormalBlack(),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            cardKeterangan,
                            style: styleTextNormalGrey(),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 3),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '',
                            style: styleTextNormalPrimary(),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Rp. ${controller.numberRibuan.format(int.parse(cardNilai))}',
                            style: styleTextNormalBlack(),
                            maxLines: 3,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
