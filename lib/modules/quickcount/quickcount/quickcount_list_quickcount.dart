// card Quickcount
import 'package:ayopemilu_mobile/modules/shared/button_add.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount/quickcount_card.dart';
import 'package:flutter/cupertino.dart';

Column quickcountListQuickcount(context) {
  return Column(
    children: [
      Expanded(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
            quickcountCard(
              "1 Juni 2023 12:45",
              "Jawa Barat, Kota Bandung, Kec Coblong, Kel Dago",
              "TPS 001",
            ),
          ],
        ),
      ),
      buttonAdd(context, 'Input Quick Count', AppRoutes.quickcountAdd)
    ],
  );
}
