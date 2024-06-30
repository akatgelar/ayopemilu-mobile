import 'package:ayopemilu_mobile/modules/inventaris/inventaris/inventaris_card.dart';
import 'package:ayopemilu_mobile/modules/shared/button_add.dart';
import 'package:ayopemilu_mobile/modules/shared/header_menu.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris/inventaris_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class InventarisPage extends StatefulWidget {
  const InventarisPage({super.key});

  @override
  State<InventarisPage> createState() => _InventarisPageState();
}

class _InventarisPageState extends State<InventarisPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventarisController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Container(
            color: ThemeColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerMenu(true, false, "Inventaris"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    decoration: styleFormInputSearch("Pencarian Inventaris"),
                    controller: controller.inventarisSearchCtrl,
                    onSubmitted: (value) {
                      controller.actionSearch();
                    },
                  ),
                ),
                controller.loadingInventaris
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: controller.inventarisData.length,
                          itemBuilder: (context, index) {
                            return inventarisCard(
                              controller.inventarisData[index].id,
                              controller.inventarisData[index].createdAt,
                              controller.inventarisData[index].title,
                              controller.inventarisData[index].description,
                              controller.inventarisData[index].amount,
                              controller.inventarisData[index].unit,
                              controller.inventarisData[index].price,
                            );
                          },
                          controller: controller.scrollController,
                        ),
                      ),
                buttonAdd(context, 'Tambah Inventaris', AppRoutes.inventarisAdd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
