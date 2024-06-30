import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran/pengeluaran_card.dart';
import 'package:ayopemilu_mobile/modules/shared/button_add.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran/pengeluaran_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class PengeluaranPage extends StatefulWidget {
  const PengeluaranPage({super.key});

  @override
  State<PengeluaranPage> createState() => _PengeluaranPageState();
}

class _PengeluaranPageState extends State<PengeluaranPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PengeluaranController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Pengeluaran"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: styleFormInputSearch("Pencarian Pengeluaran"),
                    controller: controller.pengeluaranSearchCtrl,
                    onSubmitted: (value) {
                      controller.actionSearch();
                    },
                  ),
                ),
                controller.loadingPengeluaran
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: controller.pengeluaranData.length,
                          itemBuilder: (context, index) {
                            return pengeluaranCard(
                                controller.pengeluaranData[index].id,
                                controller.pengeluaranData[index].createdAt,
                                controller.pengeluaranData[index].title,
                                controller.pengeluaranData[index].description,
                                controller.pengeluaranData[index].nominal,
                                controller);
                          },
                          controller: controller.scrollController,
                        ),
                      ),
                buttonAdd(context, 'Tambah Pengeluaran', AppRoutes.pengeluaranAdd)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
