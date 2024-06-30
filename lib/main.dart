import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:ayopemilu_mobile/modules/login/login_binding.dart';
import 'package:ayopemilu_mobile/modules/login/login_page.dart';
import 'package:ayopemilu_mobile/routes/app_pages.dart';
import 'package:ayopemilu_mobile/themes/colors_theme.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pwa_update_listener/pwa_update_listener.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeDateFormatting('id_ID', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return PwaUpdateListener(
          onReady: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    const Expanded(child: Text('Ada update tersedia')),
                    TextButton(
                      onPressed: () {
                        reloadPwa();
                      },
                      child: const Text('Update'),
                    ),
                  ],
                ),
                duration: const Duration(days: 365),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Ayo Pemilu',
            theme: ThemeColor().themeData,
            initialBinding: LoginBinding(),
            home: const LoginPage(),
            getPages: AppPages.pages,
            builder: EasyLoading.init(),
          ).animate().fadeIn(duration: 400.ms),
        );
      },
      maximumSize: const Size(475.0, 812.0),
      backgroundColor: Colors.grey,
    );
  }
}
