import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/logout/logout_controller.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogoutController>(
      builder: (controller) => Scaffold(
        backgroundColor: ThemeColor.background,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // logo
                Container(
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Image.asset('assets/images/relawan_pemilu_logo_text.png'),
                ),
                // space
                const SizedBox(height: 10),
                // logout form
              ],
            ),
          ),
        ),
      ),
    );
  }
}
