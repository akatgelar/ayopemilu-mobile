import 'package:ayopemilu_mobile/modules/login/login_binding.dart';
import 'package:ayopemilu_mobile/modules/login/login_page.dart';
import 'package:ayopemilu_mobile/modules/logout/logout_binding.dart';
import 'package:ayopemilu_mobile/modules/logout/logout_page.dart';
import 'package:ayopemilu_mobile/modules/reset_password/reset_password_binding.dart';
import 'package:ayopemilu_mobile/modules/reset_password/reset_password_page.dart';
import 'package:ayopemilu_mobile/modules/home/home_binding.dart';
import 'package:ayopemilu_mobile/modules/home/home_page.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih/pemilih_binding.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih/pemilih_page.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_add/pemilih_add_binding.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_add/pemilih_add_page.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_detail/pemilih_detail_binding.dart';
import 'package:ayopemilu_mobile/modules/pemilih/pemilih_detail/pemilih_detail_page.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan/relawan_binding.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan/relawan_page.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan_add/relawan_add_binding.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan_add/relawan_add_page.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan_detail/relawan_detail_binding.dart';
import 'package:ayopemilu_mobile/modules/relawan/relawan_detail/relawan_detail_page.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan/laporan_binding.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan/laporan_page.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_add/laporan_add_binding.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_add/laporan_add_page.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_detail/laporan_detail_binding.dart';
import 'package:ayopemilu_mobile/modules/laporan/laporan_detail/laporan_detail_page.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount/quickcount_binding.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount/quickcount_page.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount_add/quickcount_add_binding.dart';
import 'package:ayopemilu_mobile/modules/quickcount/quickcount_add/quickcount_add_page.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran/pengeluaran_binding.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran/pengeluaran_page.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran_add/pengeluaran_add_binding.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran_add/pengeluaran_add_page.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran_detail/pengeluaran_detail_binding.dart';
import 'package:ayopemilu_mobile/modules/pengeluaran/pengeluaran_detail/pengeluaran_detail_page.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris/inventaris_binding.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris/inventaris_page.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_add/inventaris_add_binding.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_add/inventaris_add_page.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_detail/inventaris_detail_binding.dart';
import 'package:ayopemilu_mobile/modules/inventaris/inventaris_detail/inventaris_detail_page.dart';
import 'package:ayopemilu_mobile/modules/setting/setting/setting_binding.dart';
import 'package:ayopemilu_mobile/modules/setting/setting/setting_page.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_profil/setting_profil_binding.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_profil/setting_profil_page.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_pemilu/setting_pemilu_binding.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_pemilu/setting_pemilu_page.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_password/setting_password_binding.dart';
import 'package:ayopemilu_mobile/modules/setting/setting_password/setting_password_page.dart';
import 'package:ayopemilu_mobile/modules/survey/survey/survey_binding.dart';
import 'package:ayopemilu_mobile/modules/survey/survey/survey_page.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_detail/survey_detail_binding.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_detail/survey_detail_page.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_add/survey_add_binding.dart';
import 'package:ayopemilu_mobile/modules/survey/survey_add/survey_add_page.dart';
import 'package:ayopemilu_mobile/modules/statistik/statistik_binding.dart';
import 'package:ayopemilu_mobile/modules/statistik/statistik_page.dart';
import 'package:ayopemilu_mobile/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.logout,
      page: () => const LogoutPage(),
      binding: LogoutBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordPage(),
      binding: ResetPasswordBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(title: ''),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.pemilih,
      page: () => const PemilihPage(),
      binding: PemilihBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.pemilihAdd,
      page: () => const PemilihAddPage(),
      binding: PemilihAddBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.pemilihDetail,
      page: () => const PemilihDetailPage(),
      binding: PemilihDetailBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.relawan,
      page: () => const RelawanPage(),
      binding: RelawanBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.relawanAdd,
      page: () => const RelawanAddPage(),
      binding: RelawanAddBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.relawanDetail,
      page: () => const RelawanDetailPage(),
      binding: RelawanDetailBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.laporan,
      page: () => const LaporanPage(),
      binding: LaporanBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.laporanAdd,
      page: () => const LaporanAddPage(),
      binding: LaporanAddBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.laporanDetail,
      page: () => const LaporanDetailPage(),
      binding: LaporanDetailBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.quickcount,
      page: () => const QuickcountPage(),
      binding: QuickcountBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.quickcountAdd,
      page: () => const QuickcountAddPage(),
      binding: QuickcountAddBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.pengeluaran,
      page: () => const PengeluaranPage(),
      binding: PengeluaranBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.pengeluaranAdd,
      page: () => const PengeluaranAddPage(),
      binding: PengeluaranAddBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.pengeluaranDetail,
      page: () => const PengeluaranDetailPage(),
      binding: PengeluaranDetailBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.inventaris,
      page: () => const InventarisPage(),
      binding: InventarisBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.inventarisAdd,
      page: () => const InventarisAddPage(),
      binding: InventarisAddBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.inventarisDetail,
      page: () => const InventarisDetailPage(),
      binding: InventarisDetailBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingPage(),
      binding: SettingBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.settingProfil,
      page: () => const SettingProfilPage(),
      binding: SettingProfilBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.settingPemilu,
      page: () => const SettingPemiluPage(),
      binding: SettingPemiluBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.settingPassword,
      page: () => const SettingPasswordPage(),
      binding: SettingPasswordBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.survey,
      page: () => const SurveyPage(),
      binding: SurveyBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.surveyDetail,
      page: () => const SurveyDetailPage(),
      binding: SurveyDetailBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.surveyAdd,
      page: () => const SurveyAddPage(),
      binding: SurveyAddBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: AppRoutes.statistik,
      page: () => const StatistikPage(),
      binding: StatistikBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
