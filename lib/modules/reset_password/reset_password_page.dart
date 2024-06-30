import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/reset_password/reset_password_controller.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
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
                // login form
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Masukkan email Anda",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        decoration: styleFormInputLogin("Email"),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        style: styleFormButton(context, 60),
                        onPressed: () {
                          InfoAlertBox(
                            context: context,
                            title: "Reset Password",
                            infoMessage: "Cek email anda untuk proses reset password!",
                            buttonText: "Ok",
                          );
                        },
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(
                            color: ThemeColor.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: TextButton(
                          style: const ButtonStyle(alignment: Alignment.center),
                          onPressed: () {
                            Get.offNamed(AppRoutes.login);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: ThemeColor.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
