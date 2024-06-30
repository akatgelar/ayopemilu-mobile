import 'package:ayopemilu_mobile/themes/app_text_theme.dart';
// import 'package:ayopemilu_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/login/login_controller.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                        "Selamat datang \nSilahkan login...",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        decoration: styleFormInputLogin("Email"),
                        controller: controller.emailCtrl,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: styleFormInputLogin("Password"),
                        controller: controller.passwordCtrl,
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        style: styleFormButton(context, 60),
                        onPressed: () {
                          controller.actionLogin(context);
                        },
                        child: const Text(
                          "Login",
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
                            Get.offNamed(AppRoutes.resetPassword);
                          },
                          child: const Text(
                            "Lupa Password",
                            style: TextStyle(
                              color: ThemeColor.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: Text(
                          'Version ${controller.packageInfo.version}',
                          style: const TextStyle(
                            color: ThemeColor.grey,
                          ),
                        ),
                      ),
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
