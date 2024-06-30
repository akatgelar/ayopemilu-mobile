// layout header
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container headerMenu(
  bool hasBackButton,
  bool isHome,
  String titleMenu,
) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: const BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black54,
          blurRadius: 1.0,
          offset: Offset(0.0, 0.75),
        )
      ],
      color: ThemeColor.greylight,
    ),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Visibility(
            maintainState: true,
            visible: hasBackButton == true,
            child: IconButton(
              icon: const Icon(CupertinoIcons.arrow_left),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Center(
            child: isHome == true
                ? Image.asset(
                    'assets/images/relawan_pemilu_logo_title.png',
                    height: 40,
                  )
                : Text(
                    titleMenu,
                    style: styleHeader(),
                  ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Image.asset('assets/icons/user.png'),
            onPressed: () {
              Get.toNamed(AppRoutes.setting);
            },
          ),
        )
      ],
    ),
  );
}
